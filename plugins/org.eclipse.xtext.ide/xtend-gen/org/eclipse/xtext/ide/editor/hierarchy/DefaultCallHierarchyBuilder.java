/**
 * Copyright (c) 2016 TypeFox GmbH (http://www.typefox.io) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 */
package org.eclipse.xtext.ide.editor.hierarchy;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.inject.Provider;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.findReferences.IReferenceFinder;
import org.eclipse.xtext.findReferences.ReferenceAcceptor;
import org.eclipse.xtext.findReferences.TargetURICollector;
import org.eclipse.xtext.findReferences.TargetURIs;
import org.eclipse.xtext.ide.editor.hierarchy.AbstractHierarchyBuilder;
import org.eclipse.xtext.ide.editor.hierarchy.DefaultHierarchyNode;
import org.eclipse.xtext.ide.editor.hierarchy.DefaultHierarchyNodeReference;
import org.eclipse.xtext.ide.editor.hierarchy.ICallHierarchyBuilder;
import org.eclipse.xtext.ide.editor.hierarchy.IHierarchyNode;
import org.eclipse.xtext.ide.editor.hierarchy.IHierarchyNodeLocationProvider;
import org.eclipse.xtext.ide.editor.hierarchy.IHierarchyNodeReference;
import org.eclipse.xtext.nodemodel.ICompositeNode;
import org.eclipse.xtext.nodemodel.util.NodeModelUtils;
import org.eclipse.xtext.resource.IEObjectDescription;
import org.eclipse.xtext.resource.IReferenceDescription;
import org.eclipse.xtext.resource.IResourceDescriptions;
import org.eclipse.xtext.resource.IResourceServiceProvider;
import org.eclipse.xtext.util.IAcceptor;
import org.eclipse.xtext.util.ITextRegionWithLineInformation;
import org.eclipse.xtext.util.concurrent.IUnitOfWork;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure2;
import org.eclipse.xtext.xbase.lib.Pure;

/**
 * <p>
 * Default implementation of a call hierarchy builder.
 * </p>
 * 
 * @author kosyakov - Initial contribution and API
 * @since 2.10
 */
@SuppressWarnings("all")
public class DefaultCallHierarchyBuilder extends AbstractHierarchyBuilder implements ICallHierarchyBuilder {
  @Accessors
  private ICallHierarchyBuilder.CallHierarchyType hierarchyType = ICallHierarchyBuilder.CallHierarchyType.CALLER;
  
  @Override
  public Collection<IHierarchyNode> buildRoots(final URI rootURI, final IProgressMonitor monitor) {
    final IEObjectDescription rootDeclaration = this.findDeclaration(rootURI);
    if ((rootDeclaration == null)) {
      return CollectionLiterals.<IHierarchyNode>emptyList();
    }
    IHierarchyNode _createRoot = this.createRoot(rootDeclaration);
    return Collections.<IHierarchyNode>unmodifiableList(CollectionLiterals.<IHierarchyNode>newArrayList(_createRoot));
  }
  
  @Override
  public Collection<IHierarchyNode> buildChildren(final IHierarchyNode parent, final IProgressMonitor monitor) {
    boolean _mayHaveChildren = parent.mayHaveChildren();
    boolean _not = (!_mayHaveChildren);
    if (_not) {
      return CollectionLiterals.<IHierarchyNode>emptyList();
    }
    final LinkedHashMap<URI, IHierarchyNode> children = CollectionLiterals.<URI, IHierarchyNode>newLinkedHashMap();
    final Procedure2<IEObjectDescription, IReferenceDescription> _function = new Procedure2<IEObjectDescription, IReferenceDescription>() {
      @Override
      public void apply(final IEObjectDescription declaration, final IReferenceDescription reference) {
        final IHierarchyNode childNode = DefaultCallHierarchyBuilder.this.createChild(children, declaration, parent);
        if ((childNode != null)) {
          Collection<IHierarchyNodeReference> _references = childNode.getReferences();
          IHierarchyNodeReference _createNodeReference = DefaultCallHierarchyBuilder.this.createNodeReference(reference);
          _references.add(_createNodeReference);
        }
      }
    };
    this.findDeclarations(parent, monitor, _function);
    return children.values();
  }
  
  protected void findDeclarations(final IHierarchyNode parent, final IProgressMonitor monitor, final Procedure2<? super IEObjectDescription, ? super IReferenceDescription> acceptor) {
    final ICallHierarchyBuilder.CallHierarchyType hierarchyType = this.hierarchyType;
    if (hierarchyType != null) {
      switch (hierarchyType) {
        case CALLEE:
          IEObjectDescription _element = parent.getElement();
          URI _eObjectURI = _element.getEObjectURI();
          this.findTargetDeclarations(_eObjectURI, monitor, acceptor);
          break;
        default:
          IEObjectDescription _element_1 = parent.getElement();
          URI _eObjectURI_1 = _element_1.getEObjectURI();
          this.findSourceDeclarations(_eObjectURI_1, monitor, acceptor);
          break;
      }
    } else {
      IEObjectDescription _element_1 = parent.getElement();
      URI _eObjectURI_1 = _element_1.getEObjectURI();
      this.findSourceDeclarations(_eObjectURI_1, monitor, acceptor);
    }
  }
  
  protected void findTargetDeclarations(final URI sourceDeclarationURI, final IProgressMonitor monitor, final Procedure2<? super IEObjectDescription, ? super IReferenceDescription> acceptor) {
    final IUnitOfWork<Object, EObject> _function = new IUnitOfWork<Object, EObject>() {
      @Override
      public Object exec(final EObject sourceDeclaration) throws Exception {
        Object _xblockexpression = null;
        {
          IReferenceFinder _referenceFinder = DefaultCallHierarchyBuilder.this.getReferenceFinder();
          IResourceServiceProvider.Registry _resourceServiceProviderRegistry = DefaultCallHierarchyBuilder.this.getResourceServiceProviderRegistry();
          final IAcceptor<IReferenceDescription> _function = new IAcceptor<IReferenceDescription>() {
            @Override
            public void accept(final IReferenceDescription reference) {
              boolean _filterReference = DefaultCallHierarchyBuilder.this.filterReference(reference);
              if (_filterReference) {
                IEObjectDescription _findTargetDeclaration = null;
                if (reference!=null) {
                  _findTargetDeclaration=DefaultCallHierarchyBuilder.this.findTargetDeclaration(reference);
                }
                final IEObjectDescription targetDeclaration = _findTargetDeclaration;
                acceptor.apply(targetDeclaration, reference);
              }
            }
          };
          ReferenceAcceptor _referenceAcceptor = new ReferenceAcceptor(_resourceServiceProviderRegistry, _function);
          _referenceFinder.findAllReferences(sourceDeclaration, _referenceAcceptor, monitor);
          _xblockexpression = null;
        }
        return _xblockexpression;
      }
    };
    this.<Object>readOnly(sourceDeclarationURI, _function);
  }
  
  protected void findSourceDeclarations(final URI targetDeclarationURI, final IProgressMonitor monitor, final Procedure2<? super IEObjectDescription, ? super IReferenceDescription> acceptor) {
    final TargetURIs targetURIs = this.collectTargetURIs(targetDeclarationURI);
    IReferenceFinder _referenceFinder = this.getReferenceFinder();
    IReferenceFinder.IResourceAccess _resourceAccess = this.getResourceAccess();
    IResourceDescriptions _indexData = this.getIndexData();
    IResourceServiceProvider.Registry _resourceServiceProviderRegistry = this.getResourceServiceProviderRegistry();
    final IAcceptor<IReferenceDescription> _function = new IAcceptor<IReferenceDescription>() {
      @Override
      public void accept(final IReferenceDescription reference) {
        boolean _filterReference = DefaultCallHierarchyBuilder.this.filterReference(reference);
        if (_filterReference) {
          IEObjectDescription _findSourceDeclaration = null;
          if (reference!=null) {
            _findSourceDeclaration=DefaultCallHierarchyBuilder.this.findSourceDeclaration(reference);
          }
          final IEObjectDescription sourceDeclaration = _findSourceDeclaration;
          acceptor.apply(sourceDeclaration, reference);
        }
      }
    };
    ReferenceAcceptor _referenceAcceptor = new ReferenceAcceptor(_resourceServiceProviderRegistry, _function);
    _referenceFinder.findAllReferences(targetURIs, _resourceAccess, _indexData, _referenceAcceptor, monitor);
  }
  
  protected TargetURIs collectTargetURIs(final URI targetURI) {
    Provider<TargetURIs> _targetURIProvider = this.getTargetURIProvider();
    final TargetURIs targetURIs = _targetURIProvider.get();
    if ((targetURI == null)) {
      return targetURIs;
    }
    final IUnitOfWork<TargetURIs, EObject> _function = new IUnitOfWork<TargetURIs, EObject>() {
      @Override
      public TargetURIs exec(final EObject targetObject) throws Exception {
        if ((targetObject == null)) {
          return targetURIs;
        }
        TargetURICollector _targetURICollector = DefaultCallHierarchyBuilder.this.getTargetURICollector();
        _targetURICollector.add(targetObject, targetURIs);
        return targetURIs;
      }
    };
    return this.<TargetURIs>readOnly(targetURI, _function);
  }
  
  protected boolean filterReference(final IReferenceDescription reference) {
    return (reference != null);
  }
  
  protected IEObjectDescription findDeclaration(final URI objectURI) {
    return this.getDescription(objectURI);
  }
  
  protected IEObjectDescription findTargetDeclaration(final IReferenceDescription reference) {
    URI _targetEObjectUri = reference.getTargetEObjectUri();
    return this.findDeclaration(_targetEObjectUri);
  }
  
  protected IEObjectDescription findSourceDeclaration(final IReferenceDescription reference) {
    URI _containerEObjectURI = reference.getContainerEObjectURI();
    return this.findDeclaration(_containerEObjectURI);
  }
  
  /**
   * @returns a root hierarchy node for the given declaration; cannot be <code>null</code>
   */
  protected IHierarchyNode createRoot(final IEObjectDescription declaration) {
    final DefaultHierarchyNode node = new DefaultHierarchyNode();
    node.setElement(declaration);
    node.setMayHaveChildren(true);
    return node;
  }
  
  /**
   * @returns a child node for the given declaration and the parent node; cannot be <code>null</code>
   */
  protected IHierarchyNode createChild(final IEObjectDescription declaration, final IHierarchyNode parent) {
    final DefaultHierarchyNode node = new DefaultHierarchyNode();
    node.setParent(parent);
    node.setElement(declaration);
    boolean _isRecursive = node.isRecursive();
    boolean _not = (!_isRecursive);
    node.setMayHaveChildren(_not);
    return node;
  }
  
  protected IHierarchyNode createChild(final Map<URI, IHierarchyNode> children, final IEObjectDescription declaration, final IHierarchyNode parent) {
    if ((declaration == null)) {
      return null;
    }
    URI _eObjectURI = declaration.getEObjectURI();
    IHierarchyNode childNode = children.get(_eObjectURI);
    if ((childNode == null)) {
      IHierarchyNode _createChild = this.createChild(declaration, parent);
      childNode = _createChild;
      URI _eObjectURI_1 = declaration.getEObjectURI();
      children.put(_eObjectURI_1, childNode);
    }
    return childNode;
  }
  
  /**
   * @returns a hierarchy node reference for the given reference; cannot be <code>null</code>
   */
  protected IHierarchyNodeReference createNodeReference(final IReferenceDescription reference) {
    URI _sourceEObjectUri = reference.getSourceEObjectUri();
    final IUnitOfWork<DefaultHierarchyNodeReference, EObject> _function = new IUnitOfWork<DefaultHierarchyNodeReference, EObject>() {
      @Override
      public DefaultHierarchyNodeReference exec(final EObject sourceObject) throws Exception {
        EReference _eReference = reference.getEReference();
        int _indexInList = reference.getIndexInList();
        final ITextRegionWithLineInformation textRegion = DefaultCallHierarchyBuilder.this.getTextRegion(sourceObject, _eReference, _indexInList);
        final String text = DefaultCallHierarchyBuilder.this.getText(sourceObject, textRegion);
        return new DefaultHierarchyNodeReference(text, textRegion, reference);
      }
    };
    return this.<DefaultHierarchyNodeReference>readOnly(_sourceEObjectUri, _function);
  }
  
  protected ITextRegionWithLineInformation getTextRegion(final EObject obj, final EReference reference, final int indexInList) {
    IHierarchyNodeLocationProvider _hierarchyNodeLocationProvider = this.getHierarchyNodeLocationProvider();
    return _hierarchyNodeLocationProvider.getTextRegion(obj, reference, indexInList);
  }
  
  protected String getText(final EObject obj, final ITextRegionWithLineInformation textRegion) {
    if (((obj == null) || (textRegion == ITextRegionWithLineInformation.EMPTY_REGION))) {
      return "";
    }
    EObject _rootContainer = EcoreUtil.getRootContainer(obj);
    final ICompositeNode node = NodeModelUtils.getNode(_rootContainer);
    if ((node == null)) {
      return "";
    }
    int _offset = textRegion.getOffset();
    int _length = textRegion.getLength();
    final int endOffset = (_offset + _length);
    ICompositeNode _rootNode = node.getRootNode();
    String _text = _rootNode.getText();
    int _offset_1 = textRegion.getOffset();
    return _text.substring(_offset_1, endOffset);
  }
  
  @Pure
  public ICallHierarchyBuilder.CallHierarchyType getHierarchyType() {
    return this.hierarchyType;
  }
  
  public void setHierarchyType(final ICallHierarchyBuilder.CallHierarchyType hierarchyType) {
    this.hierarchyType = hierarchyType;
  }
}
