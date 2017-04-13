// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:czech/czech.dart';
import 'package:test/test.dart';

void main() {
  group('Tests for bank accounts validation', () {
    test('Below inputs should be evaluated as valid bank accounts', () {
      expect(isCzechBankAccount("670100-2208282106/6210"), isTrue);
      expect(isCzechBankAccount("000000-2208282106/6210"), isTrue);
      expect(isCzechBankAccount("2208282106/6210"), isTrue);
      expect(isCzechBankAccount("2208282106/0000"), isTrue);
      expect(isCzechBankAccount("3033/2700"), isTrue);
      expect(isCzechBankAccount("3232-3232-3033/2700"), isFalse);
      expect(
          isCzechBankAccount("670100-2208282106", withBankCode: false), isTrue);
      expect(
          isCzechBankAccount("2208282106",
              withBankCode: false),
          isTrue);
    });

    test('Below inputs should be evaluated as invalid bank accounts', () {
      expect(isCzechBankAccount("670100-220darek06/6210"), isFalse);
      expect(isCzechBankAccount("#ASDF^^^)(DADSASDS"), isFalse);
      expect(isCzechBankAccount(null), isFalse);
      expect(isCzechBankAccount(""), isFalse);
      expect(isCzechBankAccount("670100-2208282106/6210", withBankCode: false),
          isFalse);
      expect(isCzechBankAccount("670100-22-08282106", withBankCode: false),
          isFalse);
      expect(
          isCzechBankAccount("2202821061111",
              withBankCode: false),
          isFalse);
    });
  });
}
