/*
 * Copyright (c) 2013, the Dart project authors.
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
package com.google.dart.tools.internal.corext.refactoring.rename;

import com.google.dart.tools.core.DartCoreDebug;
import com.google.dart.tools.ui.internal.refactoring.RefactoringMessages;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.OperationCanceledException;
import org.eclipse.ltk.core.refactoring.Change;
import org.eclipse.ltk.core.refactoring.RefactoringStatus;
import org.eclipse.ltk.core.refactoring.participants.CheckConditionsContext;
import org.eclipse.ltk.core.refactoring.participants.RefactoringArguments;
import org.eclipse.ltk.core.refactoring.participants.RefactoringProcessor;
import org.eclipse.ltk.core.refactoring.participants.RenameParticipant;

/**
 * {@link RenameParticipant} for updating resource references in Dart libraries.
 * 
 * @coverage dart.editor.ui.refactoring.core
 */
public class RenameResourceParticipant extends RenameParticipant {
  private final RenameParticipant impl;

  public RenameResourceParticipant() {
    if (DartCoreDebug.ENABLE_ANALYSIS_SERVER) {
      impl = new RenameResourceParticipant_NEW();
    } else {
      impl = new RenameResourceParticipant_OLD();
    }
  }

  @Override
  public RefactoringStatus checkConditions(IProgressMonitor pm, CheckConditionsContext context)
      throws OperationCanceledException {
    return impl.checkConditions(pm, context);
  }

  @Override
  public Change createChange(IProgressMonitor pm) throws CoreException, OperationCanceledException {
    return impl.createChange(pm);
  }

  @Override
  public Change createPreChange(IProgressMonitor pm) throws CoreException,
      OperationCanceledException {
    return impl.createPreChange(pm);
  }

  @Override
  public String getName() {
    return RefactoringMessages.RenameResourceParticipant_name;
  }

  @Override
  public boolean initialize(RefactoringProcessor processor, Object element,
      RefactoringArguments arguments) {
    return impl.initialize(processor, element, arguments);
  }

  @Override
  protected boolean initialize(Object element) {
    return false;
  }
}
