/*
 * Copyright (c) 2014, the Dart project authors.
 * 
 * Licensed under the Eclipse Public License v1.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 * 
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package com.google.dart.engine.services.internal.refactoring;

import com.google.dart.engine.element.Element;
import com.google.dart.engine.element.angular.AngularComponentElement;
import com.google.dart.engine.element.angular.AngularPropertyElement;
import com.google.dart.engine.search.SearchEngine;
import com.google.dart.engine.services.refactoring.NamingConventions;
import com.google.dart.engine.services.refactoring.Refactoring;
import com.google.dart.engine.services.status.RefactoringStatus;

import java.text.MessageFormat;

/**
 * {@link Refactoring} for renaming {@link AngularPropertyElement}.
 */
public class RenameAngularPropertyRefactoringImpl extends RenameAngularElementRefactoringImpl {
  public RenameAngularPropertyRefactoringImpl(SearchEngine searchEngine,
      AngularPropertyElement element) {
    super(searchEngine, element);
  }

  @Override
  public String getRefactoringName() {
    return "Rename Angular Property";
  }

  @Override
  protected RefactoringStatus checkNameConflicts(String newName) {
    Element enclosing = element.getEnclosingElement();
    if (enclosing instanceof AngularComponentElement) {
      AngularComponentElement component = (AngularComponentElement) enclosing;
      for (AngularPropertyElement otherProperty : component.getProperties()) {
        if (otherProperty.getName().equals(newName)) {
          String message = MessageFormat.format(
              "Component already defines property with name ''{0}''.",
              newName);
          return RefactoringStatus.createErrorStatus(message);
        }
      }
    }
    return new RefactoringStatus();
  }

  @Override
  protected RefactoringStatus checkNameSyntax(String newName) {
    return NamingConventions.validateAngularPropertyName(newName);
  }
}
