// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../../lib/src/exit_codes.dart' as exit_codes;
import '../../test_pub.dart';

main() {
  initConfig();
  integration('fails if there are extra arguments', () {
    schedulePub(args: ["global", "deactivate", "foo", "bar", "baz"],
        error: """
            Unexpected arguments "bar" and "baz".

            Usage: pub global deactivate <package>
            -h, --help    Print usage information for this command.

            Run "pub help" to see global options.
            """,
        exitCode: exit_codes.USAGE);
  });
}
