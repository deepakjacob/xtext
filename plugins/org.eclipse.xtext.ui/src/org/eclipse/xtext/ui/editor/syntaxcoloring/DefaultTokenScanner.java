/*******************************************************************************
 * Copyright (c) 2009 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.ui.editor.syntaxcoloring;

import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.rules.IToken;
import org.eclipse.jface.text.rules.Token;
import org.eclipse.xtext.ide.editor.syntaxcoloring.HighlightingStyles;

/**
 * @author Sebastian Zarnekow - Initial contribution and API
 */
public class DefaultTokenScanner extends AbstractTokenScanner {

	private int length;
	private boolean tokenReturned;

	@Override
	public int getTokenLength() {
		return length;
	}

	@Override
	public int getTokenOffset() {
		return 0;
	}

	@Override
	public IToken nextToken() {
		if (!tokenReturned) {
			tokenReturned = true;
			return new Token(getAttribute(HighlightingStyles.DEFAULT_ID));
		}
		return Token.EOF;
	}

	@Override
	public void setRange(IDocument document, int offset, int length) {
		this.length = length;
		this.tokenReturned = false;
	}

}
