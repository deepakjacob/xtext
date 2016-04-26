/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.idea.editorActions

import com.google.inject.Inject
import com.intellij.lang.CodeDocumentationAwareCommenter
import com.intellij.openapi.editor.ex.EditorEx
import com.intellij.openapi.util.TextRange
import com.intellij.psi.tree.IElementType
import com.intellij.psi.tree.TokenSet
import javax.inject.Singleton
import org.eclipse.xtext.idea.parser.TokenTypeProvider

/**
 * @author kosyakov - Initial contribution and API
 */
@Singleton
class DefaultTokenSetProvider implements TokenSetProvider {

	@Inject
	TokenTypeProvider tokenTypeProvider

	TokenSet slCommentTokens
	
	TokenSet mlCommentTokens

	@Inject
	def void setCommenter(CodeDocumentationAwareCommenter commenter) {
		slCommentTokens = TokenSet.create(commenter.lineCommentTokenType)
		mlCommentTokens = TokenSet.create(commenter.blockCommentTokenType)
	}

	override getTokenSet(EditorEx editor, int offset) {
		editor.getTokenType(offset).tokenSet
	}

	override getTokenSet(IElementType tokenType) {
		if (stringLiteralTokens.contains(tokenType))
			return stringLiteralTokens
		if (singleLineCommentTokens.contains(tokenType))
			return singleLineCommentTokens
		if (multiLineCommentTokens.contains(tokenType))
			return multiLineCommentTokens
		if (commentTokens.contains(tokenType))
			return commentTokens
		return defaultTokens
	}

	protected def getTokenType(EditorEx editor, int offset) {
		if(offset < 0 || offset > editor.document.textLength) return null

		val iterator = editor.highlighter.createIterator(offset)
		if(iterator.atEnd) return null

		iterator.tokenType
	}

	override def getCommentTokens() {
		tokenTypeProvider.commentTokens
	}

	override def getSingleLineCommentTokens() {
		slCommentTokens
	}
	
	override getMultiLineCommentTokens() {
		mlCommentTokens
	}

	override def getStringLiteralTokens() {
		tokenTypeProvider.stringLiteralTokens
	}

	override isStartOfLine(EditorEx editor, int offset) {
		editor.getTokenSet(offset).isStartOfLine(editor, offset)
	}

	override isStartOfLine(TokenSet tokenSet, EditorEx editor, int offset) {
		editor.getBeginningOfLine(offset).trim.empty
	}

	override isEndOfLine(EditorEx editor, int offset) {
		editor.getTokenSet(offset).isEndOfLine(editor, offset)
	}

	override isEndOfLine(TokenSet tokenSet, EditorEx editor, int offset) {
		editor.getEndOfLine(offset).trim.empty
	}

	protected def getBeginningOfLine(EditorEx editor, int offset) {
		val document = editor.document
		val lineNumber = editor.document.getLineNumber(offset)
		val lineStartOffset = editor.document.getLineStartOffset(lineNumber)
		document.getText(new TextRange(lineStartOffset, offset))
	}

	protected def getEndOfLine(EditorEx editor, int offset) {
		val document = editor.document
		val lineNumber = editor.document.getLineNumber(offset)
		val lineEndOffset = editor.document.getLineEndOffset(lineNumber)
		document.getText(new TextRange(offset, lineEndOffset))
	}
	
	override getDefaultTokens() {
		null
	}

}