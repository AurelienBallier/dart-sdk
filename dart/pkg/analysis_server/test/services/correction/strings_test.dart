// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.services.correction.strings;

import 'package:analysis_server/src/services/correction/strings.dart';
import 'package:unittest/unittest.dart' hide isEmpty;

import '../../reflective_tests.dart';



main() {
  groupSep = ' | ';
  runReflectiveTests(StringsTest);
}


@ReflectiveTestCase()
class StringsTest {
  void test_capitalize() {
    expect(capitalize(''), '');
    expect(capitalize('a'), 'A');
    expect(capitalize('abc'), 'Abc');
    expect(capitalize('abc def'), 'Abc def');
    expect(capitalize('ABC'), 'ABC');
  }

  void test_compareStrings() {
    expect(compareStrings(null, null), 0);
    expect(compareStrings(null, 'b'), 1);
    expect(compareStrings('a', null), -1);
    expect(compareStrings('a', 'b'), -1);
    expect(compareStrings('b', 'a'), 1);
  }

  void test_findCommonOverlap() {
    expect(findCommonOverlap('', 'abcd'), 0);
    expect(findCommonOverlap('abc', 'abcd'), 3);
    expect(findCommonOverlap('123456', 'abcd'), 0);
    expect(findCommonOverlap('123456xxx', 'xxxabcd'), 3);
    expect(findCommonOverlap('123456', '56'), 2);
    expect(findCommonOverlap('56', '56789'), 2);
  }

  void test_findCommonPrefix() {
    expect(findCommonPrefix('abc', 'xyz'), 0);
    expect(findCommonPrefix('1234abcdef', '1234xyz'), 4);
    expect(findCommonPrefix('123', '123xyz'), 3);
  }

  void test_findCommonSuffix() {
    expect(findCommonSuffix('abc', 'xyz'), 0);
    expect(findCommonSuffix('abcdef1234', 'xyz1234'), 4);
    expect(findCommonSuffix('123', 'xyz123'), 3);
  }

  void test_isBlank() {
    expect(isBlank(null), isTrue);
    expect(isBlank(''), isTrue);
    expect(isBlank(' '), isTrue);
    expect(isBlank('\t'), isTrue);
    expect(isBlank('  '), isTrue);
    expect(isBlank('X'), isFalse);
  }

  void test_isDigit() {
    for (int c in '0123456789'.codeUnits) {
      expect(isDigit(c), isTrue);
    }
    expect(isDigit(' '.codeUnitAt(0)), isFalse);
    expect(isDigit('A'.codeUnitAt(0)), isFalse);
  }

  void test_isEmpty() {
    expect(isEmpty(null), isTrue);
    expect(isEmpty(''), isTrue);
    expect(isEmpty('X'), isFalse);
    expect(isEmpty(' '), isFalse);
  }

  void test_isLetter() {
    for (int c in 'abcdefghijklmnopqrstuvwxyz'.codeUnits) {
      expect(isLetter(c), isTrue);
    }
    for (int c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.codeUnits) {
      expect(isLetter(c), isTrue);
    }
    expect(isLetter(' '.codeUnitAt(0)), isFalse);
    expect(isLetter('0'.codeUnitAt(0)), isFalse);
  }

  void test_isLetterOrDigit() {
    for (int c in 'abcdefghijklmnopqrstuvwxyz'.codeUnits) {
      expect(isLetterOrDigit(c), isTrue);
    }
    for (int c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.codeUnits) {
      expect(isLetterOrDigit(c), isTrue);
    }
    for (int c in '0123456789'.codeUnits) {
      expect(isLetterOrDigit(c), isTrue);
    }
    expect(isLetterOrDigit(' '.codeUnitAt(0)), isFalse);
    expect(isLetterOrDigit('.'.codeUnitAt(0)), isFalse);
  }

  void test_isLowerCase() {
    for (int c in 'abcdefghijklmnopqrstuvwxyz'.codeUnits) {
      expect(isLowerCase(c), isTrue);
    }
    for (int c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.codeUnits) {
      expect(isLowerCase(c), isFalse);
    }
    expect(isLowerCase(' '.codeUnitAt(0)), isFalse);
    expect(isLowerCase('0'.codeUnitAt(0)), isFalse);
  }

  void test_isSpace() {
    expect(isSpace(' '.codeUnitAt(0)), isTrue);
    expect(isSpace('\t'.codeUnitAt(0)), isTrue);
    expect(isSpace('\r'.codeUnitAt(0)), isFalse);
    expect(isSpace('\n'.codeUnitAt(0)), isFalse);
    expect(isSpace('0'.codeUnitAt(0)), isFalse);
    expect(isSpace('A'.codeUnitAt(0)), isFalse);
  }

  void test_isUpperCase() {
    for (int c in 'abcdefghijklmnopqrstuvwxyz'.codeUnits) {
      expect(isUpperCase(c), isFalse);
    }
    for (int c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.codeUnits) {
      expect(isUpperCase(c), isTrue);
    }
    expect(isUpperCase(' '.codeUnitAt(0)), isFalse);
    expect(isUpperCase('0'.codeUnitAt(0)), isFalse);
  }

  void test_isWhitespace() {
    expect(isWhitespace(' '.codeUnitAt(0)), isTrue);
    expect(isWhitespace('\t'.codeUnitAt(0)), isTrue);
    expect(isWhitespace('\r'.codeUnitAt(0)), isTrue);
    expect(isWhitespace('\n'.codeUnitAt(0)), isTrue);
    expect(isWhitespace('0'.codeUnitAt(0)), isFalse);
    expect(isWhitespace('A'.codeUnitAt(0)), isFalse);
  }

  void test_remove() {
    expect(remove(null, 'x'), null);
    expect(remove('abc', null), 'abc');
    expect(remove('abc abbc abbbc', 'b'), 'ac ac ac');
    expect(remove('abc abbc abbbc', 'bc'), 'a ab abb');
  }

  void test_removeEnd() {
    expect(removeEnd(null, 'x'), null);
    expect(removeEnd('abc', null), 'abc');
    expect(removeEnd('www.domain.com', '.com.'), 'www.domain.com');
    expect(removeEnd('www.domain.com', 'domain'), 'www.domain.com');
    expect(removeEnd('www.domain.com', '.com'), 'www.domain');
  }

  void test_removeStart() {
    expect(removeStart(null, 'x'), null);
    expect(removeStart('abc', null), 'abc');
    expect(removeStart('abcTest', 'abc'), 'Test');
    expect(removeStart('my abcTest', 'abc'), 'my abcTest');
  }

  void test_repeat() {
    expect(repeat('x', 0), '');
    expect(repeat('x', 5), 'xxxxx');
    expect(repeat('abc', 3), 'abcabcabc');
  }

  void test_substringAfterLast() {
    expect(substringAfterLast('', '/'), '');
    expect(substringAfterLast('abc', ''), '');
    expect(substringAfterLast('abc', 'd'), 'abc');
    expect(substringAfterLast('abcbde', 'b'), 'de');
  }
}
