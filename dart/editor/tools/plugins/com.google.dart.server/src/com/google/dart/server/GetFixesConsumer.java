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
package com.google.dart.server;

import com.google.dart.server.generated.types.AnalysisError;
import com.google.dart.server.generated.types.AnalysisErrorFixes;

import java.util.List;

/**
 * The interface {@code FixesConsumer} defines the behavior of objects that consume fixes for
 * errors.
 * 
 * @coverage dart.server
 */
public interface GetFixesConsumer extends Consumer {
  /**
   * A set fixes has been computed. Note that not every {@link AnalysisError} can be fixed, so not
   * for all of the any fixes will be returned.
   * 
   * @param errorFixesArray a list of computed error fixes
   */
  public void computedFixes(List<AnalysisErrorFixes> errorFixesArray);
}
