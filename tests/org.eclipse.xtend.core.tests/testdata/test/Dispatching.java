/*******************************************************************************
 * Copyright (c) 2011 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package test;

/**
 * @author Sebastian Zarnekow - Initial contribution and API
 */
public class Dispatching {

	public CharSequence doDispatch(Object o) {
		return null;
	}
	
	public StringBuilder _doDispatch(StringBuilder sb) {
		return null;
	}
	
	public String _doDispatch(Object o) {
		return null;
	}
	
	public StringBuffer _doDispatch(StringBuffer sb) {
		return null;
	}
	
}
