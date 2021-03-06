/*
 * generated by Xtext
 */
grammar PsiInternalFragmentTestLanguageEx;

options {
	superClass=AbstractPsiAntlrParser;
}

@lexer::header {
package org.eclipse.xtext.parser.fragments.idea.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.eclipse.xtext.parser.fragments.idea.parser.antlr.internal;

import org.eclipse.xtext.idea.parser.AbstractPsiAntlrParser;
import org.eclipse.xtext.parser.fragments.idea.lang.FragmentTestLanguageExElementTypeProvider;
import org.eclipse.xtext.idea.parser.TokenTypeProvider;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.fragments.services.FragmentTestLanguageExGrammarAccess;

import com.intellij.lang.PsiBuilder;
}

@parser::members {

	protected FragmentTestLanguageExGrammarAccess grammarAccess;

	protected FragmentTestLanguageExElementTypeProvider elementTypeProvider;

	public PsiInternalFragmentTestLanguageExParser(PsiBuilder builder, TokenStream input, FragmentTestLanguageExElementTypeProvider elementTypeProvider, FragmentTestLanguageExGrammarAccess grammarAccess) {
		this(input);
		setPsiBuilder(builder);
    	this.grammarAccess = grammarAccess;
		this.elementTypeProvider = elementTypeProvider;
	}

	@Override
	protected String getFirstRuleName() {
		return "ParserRuleFragmentsEx";
	}

}

//Entry rule entryRuleParserRuleFragmentsEx
entryRuleParserRuleFragmentsEx returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getParserRuleFragmentsExElementType()); }
	iv_ruleParserRuleFragmentsEx=ruleParserRuleFragmentsEx
	{ $current=$iv_ruleParserRuleFragmentsEx.current; }
	EOF;

// Rule ParserRuleFragmentsEx
ruleParserRuleFragmentsEx returns [Boolean current=false]
:
	{
		markComposite(elementTypeProvider.getParserRuleFragmentsEx_ParserRuleFragmentsParserRuleCallElementType());
	}
	this_ParserRuleFragments_0=ruleParserRuleFragments
	{
		$current = $this_ParserRuleFragments_0.current;
		doneComposite();
	}
;

//Entry rule entryRuleParserRuleFragments
entryRuleParserRuleFragments returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getParserRuleFragmentsElementType()); }
	iv_ruleParserRuleFragments=ruleParserRuleFragments
	{ $current=$iv_ruleParserRuleFragments.current; }
	EOF;

// Rule ParserRuleFragments
ruleParserRuleFragments returns [Boolean current=false]
:
	(
		(
			{
				precedeComposite(elementTypeProvider.getParserRuleFragments_ParserRuleFragmentsAction_0ElementType());
				doneComposite();
				associateWithSemanticElement();
			}
		)
		(
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitOneKeyword_1_0_0ElementType());
				}
				otherlv_1='#1'
				{
					doneLeaf(otherlv_1);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedParserRuleCall_1_0_1_0ElementType());
						}
						lv_element_2_0=rulePRFNamed
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitTwoKeyword_1_1_0ElementType());
				}
				otherlv_3='#2'
				{
					doneLeaf(otherlv_3);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedParserRuleCall_1_1_1_0ElementType());
						}
						lv_element_4_0=rulePRFNamed
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_HyphenMinusGreaterThanSignKeyword_1_1_2ElementType());
				}
				otherlv_5='->'
				{
					doneLeaf(otherlv_5);
				}
				(
					(
						{
							if (!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
						{
							markLeaf(elementTypeProvider.getParserRuleFragments_RefPRFNamedCrossReference_1_1_3_0ElementType());
						}
						otherlv_6=RULE_ID
						{
							doneLeaf(otherlv_6);
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitThreeKeyword_1_2_0ElementType());
				}
				otherlv_7='#3'
				{
					doneLeaf(otherlv_7);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedRefFirstParserRuleCall_1_2_1_0ElementType());
						}
						lv_element_8_0=rulePRFNamedRefFirst
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitFourKeyword_1_3_0ElementType());
				}
				otherlv_9='#4'
				{
					doneLeaf(otherlv_9);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedWithActionParserRuleCall_1_3_1_0ElementType());
						}
						lv_element_10_0=rulePRFNamedWithAction
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitEightKeyword_1_4_0ElementType());
				}
				otherlv_11='#8'
				{
					doneLeaf(otherlv_11);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedWithFQNParserRuleCall_1_4_1_0ElementType());
						}
						lv_element_12_0=rulePRFNamedWithFQN
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitNineKeyword_1_5_0ElementType());
				}
				otherlv_13='#9'
				{
					doneLeaf(otherlv_13);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFWithPredicateParserRuleCall_1_5_1_0ElementType());
						}
						lv_element_14_0=rulePRFWithPredicate
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitOneDigitZeroKeyword_1_6_0ElementType());
				}
				otherlv_15='#10'
				{
					doneLeaf(otherlv_15);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedRecursiveParserRuleCall_1_6_1_0ElementType());
						}
						lv_element_16_0=rulePRFNamedRecursive
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getParserRuleFragments_NumberSignDigitOneDigitOneKeyword_1_7_0ElementType());
				}
				otherlv_17='#11'
				{
					doneLeaf(otherlv_17);
				}
				(
					(
						{
							markComposite(elementTypeProvider.getParserRuleFragments_ElementPRFNamedRecursiveFragmentParserRuleCall_1_7_1_0ElementType());
						}
						lv_element_18_0=rulePRFNamedRecursiveFragment
						{
							doneComposite();
							if(!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
					)
				)
			)
		)
	)
;

//Entry rule entryRulePRFNamed
entryRulePRFNamed returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFNamedElementType()); }
	iv_rulePRFNamed=rulePRFNamed
	{ $current=$iv_rulePRFNamed.current; }
	EOF;

// Rule PRFNamed
rulePRFNamed returns [Boolean current=false]
:
	(
		{
			if (!$current) {
				associateWithSemanticElement();
				$current = true;
			}
			markComposite(elementTypeProvider.getPRFNamed_PRFNamedFragmentParserRuleCall_0ElementType());
		}
		this_PRFNamedFragment_0=rulePRFNamedFragment[$current]
		{
			$current = $this_PRFNamedFragment_0.current;
			doneComposite();
		}
		(
			(
				{
					markLeaf(elementTypeProvider.getPRFNamed_ColonKeyword_1_0_0ElementType());
				}
				otherlv_1=':'
				{
					doneLeaf(otherlv_1);
				}
				(
					(
						{
							if (!$current) {
								associateWithSemanticElement();
								$current = true;
							}
						}
						{
							markLeaf(elementTypeProvider.getPRFNamed_RefPRFNamedCrossReference_1_0_1_0ElementType());
						}
						otherlv_2=RULE_ID
						{
							doneLeaf(otherlv_2);
						}
					)
				)
			)
			    |
			(
				{
					markLeaf(elementTypeProvider.getPRFNamed_HyphenMinusKeyword_1_1_0ElementType());
				}
				otherlv_3='-'
				{
					doneLeaf(otherlv_3);
				}
				{
					if (!$current) {
						associateWithSemanticElement();
						$current = true;
					}
					markComposite(elementTypeProvider.getPRFNamed_PRFNamedRefParserRuleCall_1_1_1ElementType());
				}
				this_PRFNamedRef_4=rulePRFNamedRef[$current]
				{
					$current = $this_PRFNamedRef_4.current;
					doneComposite();
				}
			)
		)?
	)
;

//Entry rule entryRulePRFNamedRecursive
entryRulePRFNamedRecursive returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFNamedRecursiveElementType()); }
	iv_rulePRFNamedRecursive=rulePRFNamedRecursive
	{ $current=$iv_rulePRFNamedRecursive.current; }
	EOF;

// Rule PRFNamedRecursive
rulePRFNamedRecursive returns [Boolean current=false]
:
	(
		(
			(
				{
					markLeaf(elementTypeProvider.getPRFNamedRecursive_NameIDTerminalRuleCall_0_0ElementType());
				}
				lv_name_0_0=RULE_ID
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_name_0_0);
				}
			)
		)
		{
			if (!$current) {
				associateWithSemanticElement();
				$current = true;
			}
			markComposite(elementTypeProvider.getPRFNamedRecursive_RecursiveFromFragmentParserRuleCall_1ElementType());
		}
		this_RecursiveFromFragment_1=ruleRecursiveFromFragment[$current]
		{
			$current = $this_RecursiveFromFragment_1.current;
			doneComposite();
		}
	)
;

//Entry rule entryRulePRFNamedRecursiveFragment
entryRulePRFNamedRecursiveFragment returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFNamedRecursiveFragmentElementType()); }
	iv_rulePRFNamedRecursiveFragment=rulePRFNamedRecursiveFragment
	{ $current=$iv_rulePRFNamedRecursiveFragment.current; }
	EOF;

// Rule PRFNamedRecursiveFragment
rulePRFNamedRecursiveFragment returns [Boolean current=false]
:
	(
		(
			(
				{
					markLeaf(elementTypeProvider.getPRFNamedRecursiveFragment_NameIDTerminalRuleCall_0_0ElementType());
				}
				lv_name_0_0=RULE_ID
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_name_0_0);
				}
			)
		)
		{
			if (!$current) {
				associateWithSemanticElement();
				$current = true;
			}
			markComposite(elementTypeProvider.getPRFNamedRecursiveFragment_RecursiveFragmentParserRuleCall_1ElementType());
		}
		this_RecursiveFragment_1=ruleRecursiveFragment[$current]
		{
			$current = $this_RecursiveFragment_1.current;
			doneComposite();
		}
	)
;

//Entry rule entryRulePRFNamedRefFirst
entryRulePRFNamedRefFirst returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFNamedRefFirstElementType()); }
	iv_rulePRFNamedRefFirst=rulePRFNamedRefFirst
	{ $current=$iv_rulePRFNamedRefFirst.current; }
	EOF;

// Rule PRFNamedRefFirst
rulePRFNamedRefFirst returns [Boolean current=false]
:
	(
		(
			(
				{
					if (!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					markLeaf(elementTypeProvider.getPRFNamedRefFirst_RefPRFNamedCrossReference_0_0ElementType());
				}
				otherlv_0=RULE_ID
				{
					doneLeaf(otherlv_0);
				}
			)
		)
		{
			markLeaf(elementTypeProvider.getPRFNamedRefFirst_LessThanSignHyphenMinusKeyword_1ElementType());
		}
		otherlv_1='<-'
		{
			doneLeaf(otherlv_1);
		}
		{
			if (!$current) {
				associateWithSemanticElement();
				$current = true;
			}
			markComposite(elementTypeProvider.getPRFNamedRefFirst_PRFNamedFragmentParserRuleCall_2ElementType());
		}
		this_PRFNamedFragment_2=rulePRFNamedFragment[$current]
		{
			$current = $this_PRFNamedFragment_2.current;
			doneComposite();
		}
	)
;

//Entry rule entryRulePRFNamedWithAction
entryRulePRFNamedWithAction returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFNamedWithActionElementType()); }
	iv_rulePRFNamedWithAction=rulePRFNamedWithAction
	{ $current=$iv_rulePRFNamedWithAction.current; }
	EOF;

// Rule PRFNamedWithAction
rulePRFNamedWithAction returns [Boolean current=false]
:
	(
		{
			markComposite(elementTypeProvider.getPRFNamedWithAction_PRFNamedParserRuleCall_0ElementType());
		}
		this_PRFNamed_0=rulePRFNamed
		{
			$current = $this_PRFNamed_0.current;
			doneComposite();
		}
		(
			{
				precedeComposite(elementTypeProvider.getPRFNamedWithAction_PRFNamedWithActionPrevAction_1ElementType());
				doneComposite();
				associateWithSemanticElement();
			}
		)
		(
			(
				{
					markLeaf(elementTypeProvider.getPRFNamedWithAction_NameIDTerminalRuleCall_2_0ElementType());
				}
				lv_name_2_0=RULE_ID
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_name_2_0);
				}
			)
		)
		(
			(
				(
					{
						if (!$current) {
							associateWithSemanticElement();
							$current = true;
						}
					}
					{
						markLeaf(elementTypeProvider.getPRFNamedWithAction_RefPRFNamedCrossReference_3_0_0ElementType());
					}
					otherlv_3=RULE_ID
					{
						doneLeaf(otherlv_3);
					}
				)
			)
			(
				(
					{
						if (!$current) {
							associateWithSemanticElement();
							$current = true;
						}
					}
					{
						markLeaf(elementTypeProvider.getPRFNamedWithAction_Ref2PRFNamedCrossReference_3_1_0ElementType());
					}
					otherlv_4=RULE_ID
					{
						doneLeaf(otherlv_4);
					}
				)
			)
		)?
	)
;

//Entry rule entryRulePRFNamedWithFQN
entryRulePRFNamedWithFQN returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFNamedWithFQNElementType()); }
	iv_rulePRFNamedWithFQN=rulePRFNamedWithFQN
	{ $current=$iv_rulePRFNamedWithFQN.current; }
	EOF;

// Rule PRFNamedWithFQN
rulePRFNamedWithFQN returns [Boolean current=false]
:
	(
		(
			(
				{
					markComposite(elementTypeProvider.getPRFNamedWithFQN_NameFQNParserRuleCall_0_0ElementType());
				}
				lv_name_0_0=ruleFQN
				{
					doneComposite();
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
			)
		)
		(
			{
				markLeaf(elementTypeProvider.getPRFNamedWithFQN_HyphenMinusKeyword_1_0ElementType());
			}
			otherlv_1='-'
			{
				doneLeaf(otherlv_1);
			}
			(
				(
					{
						if (!$current) {
							associateWithSemanticElement();
							$current = true;
						}
					}
					{
						markComposite(elementTypeProvider.getPRFNamedWithFQN_RefPRFNamedCrossReference_1_1_0ElementType());
					}
					ruleFQN2
					{
						doneComposite();
					}
				)
			)
		)?
	)
;

//Entry rule entryRulePRFWithPredicate
entryRulePRFWithPredicate returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getPRFWithPredicateElementType()); }
	iv_rulePRFWithPredicate=rulePRFWithPredicate
	{ $current=$iv_rulePRFWithPredicate.current; }
	EOF;

// Rule PRFWithPredicate
rulePRFWithPredicate returns [Boolean current=false]
:
	(
		{
			if (!$current) {
				associateWithSemanticElement();
				$current = true;
			}
			markComposite(elementTypeProvider.getPRFWithPredicate_PRFNamedFragmentParserRuleCall_0ElementType());
		}
		this_PRFNamedFragment_0=rulePRFNamedFragment[$current]
		{
			$current = $this_PRFNamedFragment_0.current;
			doneComposite();
		}
		(
			((
				'-'
				rulePRFNamedRef[null]
			)
			)=>
			(
				{
					markLeaf(elementTypeProvider.getPRFWithPredicate_HyphenMinusKeyword_1_0_0ElementType());
				}
				otherlv_1='-'
				{
					doneLeaf(otherlv_1);
				}
				{
					if (!$current) {
						associateWithSemanticElement();
						$current = true;
					}
					markComposite(elementTypeProvider.getPRFWithPredicate_PRFNamedRefParserRuleCall_1_0_1ElementType());
				}
				this_PRFNamedRef_2=rulePRFNamedRef[$current]
				{
					$current = $this_PRFNamedRef_2.current;
					doneComposite();
				}
			)
		)?
	)
;

//Entry rule entryRuleFQN
entryRuleFQN returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getFQNElementType()); }
	iv_ruleFQN=ruleFQN
	{ $current=$iv_ruleFQN.current; }
	EOF;

// Rule FQN
ruleFQN returns [Boolean current=false]
:
	(
		{
			markLeaf(elementTypeProvider.getFQN_IDTerminalRuleCall_0ElementType());
		}
		this_ID_0=RULE_ID
		{
			doneLeaf(this_ID_0);
		}
		(
			{
				markComposite(elementTypeProvider.getFQN_SuffixParserRuleCall_1ElementType());
			}
			ruleSuffix
			{
				doneComposite();
			}
		)?
	)
;

//Entry rule entryRuleFQN2
entryRuleFQN2 returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getFQN2ElementType()); }
	iv_ruleFQN2=ruleFQN2
	{ $current=$iv_ruleFQN2.current; }
	EOF;

// Rule FQN2
ruleFQN2 returns [Boolean current=false]
:
	(
		{
			markLeaf(elementTypeProvider.getFQN2_IDTerminalRuleCall_0ElementType());
		}
		this_ID_0=RULE_ID
		{
			doneLeaf(this_ID_0);
		}
		(
			{
				markComposite(elementTypeProvider.getFQN2_Suffix2ParserRuleCall_1ElementType());
			}
			ruleSuffix2
			{
				doneComposite();
			}
		)*
	)
;


// Rule Suffix
ruleSuffix returns [Boolean current=false]
:
	(
		{
			markLeaf(elementTypeProvider.getSuffix_FullStopKeyword_0ElementType());
		}
		kw='.'
		{
			doneLeaf(kw);
		}
		{
			markLeaf(elementTypeProvider.getSuffix_IDTerminalRuleCall_1ElementType());
		}
		this_ID_1=RULE_ID
		{
			doneLeaf(this_ID_1);
		}
		(
			{
				markComposite(elementTypeProvider.getSuffix_SuffixParserRuleCall_2ElementType());
			}
			ruleSuffix
			{
				doneComposite();
			}
		)?
	)
;


// Rule Suffix2
ruleSuffix2 returns [Boolean current=false]
:
	(
		{
			markLeaf(elementTypeProvider.getSuffix2_FullStopKeyword_0ElementType());
		}
		kw='.'
		{
			doneLeaf(kw);
		}
		{
			markLeaf(elementTypeProvider.getSuffix2_IDTerminalRuleCall_1ElementType());
		}
		this_ID_1=RULE_ID
		{
			doneLeaf(this_ID_1);
		}
	)
;


// Rule PRFNamedFragment
rulePRFNamedFragment[Boolean in_current]  returns [Boolean current=in_current]
:
	(
		(
			{
				markLeaf(elementTypeProvider.getPRFNamedFragment_NameIDTerminalRuleCall_0ElementType());
			}
			lv_name_0_0=RULE_ID
			{
				if(!$current) {
					associateWithSemanticElement();
					$current = true;
				}
			}
			{
				doneLeaf(lv_name_0_0);
			}
		)
	)
;


// Rule PRFNamedRef
rulePRFNamedRef[Boolean in_current]  returns [Boolean current=in_current]
:
	(
		(
			{
				if (!$current) {
					associateWithSemanticElement();
					$current = true;
				}
			}
			{
				markLeaf(elementTypeProvider.getPRFNamedRef_RefPRFNamedCrossReference_0ElementType());
			}
			otherlv_0=RULE_ID
			{
				doneLeaf(otherlv_0);
			}
		)
	)
;


// Rule RecursiveFromFragment
ruleRecursiveFromFragment[Boolean in_current]  returns [Boolean current=in_current]
:
	(
		(
			{
				markComposite(elementTypeProvider.getRecursiveFromFragment_PrevNamedInParenthesesParserRuleCall_0ElementType());
			}
			lv_prev_0_0=ruleNamedInParentheses
			{
				doneComposite();
				if(!$current) {
					associateWithSemanticElement();
					$current = true;
				}
			}
		)
	)
;

//Entry rule entryRuleNamedInParentheses
entryRuleNamedInParentheses returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getNamedInParenthesesElementType()); }
	iv_ruleNamedInParentheses=ruleNamedInParentheses
	{ $current=$iv_ruleNamedInParentheses.current; }
	EOF;

// Rule NamedInParentheses
ruleNamedInParentheses returns [Boolean current=false]
:
	(
		(
			{
				markLeaf(elementTypeProvider.getNamedInParentheses_LeftParenthesisKeyword_0_0ElementType());
			}
			otherlv_0='('
			{
				doneLeaf(otherlv_0);
			}
			{
				markComposite(elementTypeProvider.getNamedInParentheses_NamedInParenthesesParserRuleCall_0_1ElementType());
			}
			this_NamedInParentheses_1=ruleNamedInParentheses
			{
				$current = $this_NamedInParentheses_1.current;
				doneComposite();
			}
			{
				markLeaf(elementTypeProvider.getNamedInParentheses_RightParenthesisKeyword_0_2ElementType());
			}
			otherlv_2=')'
			{
				doneLeaf(otherlv_2);
			}
		)
		    |
		(
			(
				{
					precedeComposite(elementTypeProvider.getNamedInParentheses_PRFNamedAction_1_0ElementType());
					doneComposite();
					associateWithSemanticElement();
				}
			)
			(
				(
					{
						markLeaf(elementTypeProvider.getNamedInParentheses_NameIDTerminalRuleCall_1_1_0ElementType());
					}
					lv_name_4_0=RULE_ID
					{
						if(!$current) {
							associateWithSemanticElement();
							$current = true;
						}
					}
					{
						doneLeaf(lv_name_4_0);
					}
				)
			)
		)
	)
;


// Rule RecursiveFragment
ruleRecursiveFragment[Boolean in_current]  returns [Boolean current=in_current]
:
	(
		(
			{
				markLeaf(elementTypeProvider.getRecursiveFragment_LeftParenthesisKeyword_0_0ElementType());
			}
			otherlv_0='('
			{
				doneLeaf(otherlv_0);
			}
			{
				if (!$current) {
					associateWithSemanticElement();
					$current = true;
				}
				markComposite(elementTypeProvider.getRecursiveFragment_RecursiveFragmentParserRuleCall_0_1ElementType());
			}
			this_RecursiveFragment_1=ruleRecursiveFragment[$current]
			{
				$current = $this_RecursiveFragment_1.current;
				doneComposite();
			}
			{
				markLeaf(elementTypeProvider.getRecursiveFragment_RightParenthesisKeyword_0_2ElementType());
			}
			otherlv_2=')'
			{
				doneLeaf(otherlv_2);
			}
		)
		    |
		(
			(
				{
					markComposite(elementTypeProvider.getRecursiveFragment_PrevNamedByActionParserRuleCall_1_0ElementType());
				}
				lv_prev_3_0=ruleNamedByAction
				{
					doneComposite();
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
			)
		)
	)
;

//Entry rule entryRuleNamedByAction
entryRuleNamedByAction returns [Boolean current=false]:
	{ markComposite(elementTypeProvider.getNamedByActionElementType()); }
	iv_ruleNamedByAction=ruleNamedByAction
	{ $current=$iv_ruleNamedByAction.current; }
	EOF;

// Rule NamedByAction
ruleNamedByAction returns [Boolean current=false]
:
	(
		(
			{
				precedeComposite(elementTypeProvider.getNamedByAction_PRFNamedAction_0ElementType());
				doneComposite();
				associateWithSemanticElement();
			}
		)
		(
			(
				{
					markLeaf(elementTypeProvider.getNamedByAction_NameIDTerminalRuleCall_1_0ElementType());
				}
				lv_name_1_0=RULE_ID
				{
					if(!$current) {
						associateWithSemanticElement();
						$current = true;
					}
				}
				{
					doneLeaf(lv_name_1_0);
				}
			)
		)
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
