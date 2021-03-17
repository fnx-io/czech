// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:czech/czech.dart';
import 'package:test/test.dart';

void main() {
  group('Tests for bank accounts validation', () {
    test('Below inputs should be evaluated as valid bank accounts', () {
      expect(isCzechBankAccount('670100-2208282106/6210'), isTrue);
      expect(
          isCzechBankAccount('670100-2208282106', withBankCode: false), isTrue);
      expect(isCzechBankAccount('000000-2208282106/6210'), isTrue);
      expect(
          isCzechBankAccount('000000-2208282106', withBankCode: false), isTrue);
      expect(isCzechBankAccount('107-7640030277/0100'), isTrue);
      expect(isCzechBankAccount('107-7640030277', withBankCode: false), isTrue);
      expect(isCzechBankAccount('2208282106/6210'), isTrue);
      expect(isCzechBankAccount('2208282106', withBankCode: false), isTrue);
      expect(isCzechBankAccount('2208282106/0000'), isTrue);
      expect(isCzechBankAccount('2208282106', withBankCode: false), isTrue);
      expect(isCzechBankAccount('1112001651/0710'), isTrue);
      expect(isCzechBankAccount('1112001651', withBankCode: false), isTrue);
      expect(isCzechBankAccount('1112003411/0710'), isTrue);
      expect(isCzechBankAccount('1112003411', withBankCode: false), isTrue);
      expect(isCzechBankAccount('000000-2840392309/0800'), isTrue);
      expect(
          isCzechBankAccount('000000-2840392309', withBankCode: false), isTrue);
      expect(isCzechBankAccount('000000-3689301359/0800'), isTrue);
      expect(
          isCzechBankAccount('000000-3689301359', withBankCode: false), isTrue);
      expect(isCzechBankAccount('009021-0388063349/0800'), isTrue);
      expect(
          isCzechBankAccount('009021-0388063349', withBankCode: false), isTrue);
      expect(isCzechBankAccount('7120201001/5500'), isTrue);
      expect(isCzechBankAccount('7120201001', withBankCode: false), isTrue);
      expect(isCzechBankAccount('43-9618960207/0100'), isTrue);
      expect(isCzechBankAccount('43-9618960207', withBankCode: false), isTrue);
      expect(isCzechBankAccount('115-4333670297/0100'), isTrue);
      expect(isCzechBankAccount('115-4333670297', withBankCode: false), isTrue);
      expect(isCzechBankAccount('115-3261400217/0100'), isTrue);
      expect(isCzechBankAccount('115-3261400217', withBankCode: false), isTrue);
      expect(isCzechBankAccount('2500873069 / 2010'), isTrue);
      expect(isCzechBankAccount('2500873069 ', withBankCode: false), isTrue);
      expect(isCzechBankAccount('2500243518 / 2010'), isTrue);
      expect(isCzechBankAccount('2500243518 ', withBankCode: false), isTrue);
      expect(isCzechBankAccount('3033/2700'), isTrue);
      expect(isCzechBankAccount('3033', withBankCode: false), isTrue);
      expect(
          isCzechBankAccount('670100-2208282106', withBankCode: false), isTrue);
      expect(isCzechBankAccount('2208282106', withBankCode: false), isTrue);
    });

    test('Below inputs should be evaluated as invalid bank accounts', () {
      expect(isCzechBankAccount(''), isFalse);
      expect(isCzechBankAccount('670100-220darek06/6210'), isFalse);
      expect(isCzechBankAccount('3232-3232-3033/2700'), isFalse);
      expect(isCzechBankAccount('#ASDF^^^)(DADSASDS'), isFalse);
      expect(isCzechBankAccount('670100-2208282106/6210', withBankCode: false),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('670100-22-08282106', withBankCode: false),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('2202821061111', withBankCode: false),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('9823736736761', withBankCode: false),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('233331-2343434334/0330'),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('233331-2343434334'), isFalse); // No bank code
      expect(isCzechBankAccount('342543-2345455554/4330'),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('342543-2345455554'), isFalse); // No bank code
      expect(isCzechBankAccount('846543-4562454434/3450'),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('846543-4562454434'), isFalse); // No bank code
      expect(isCzechBankAccount('908983-3248327774/6450'),
          isFalse); // Invalid structure
      expect(isCzechBankAccount('908983-3248327774'), isFalse); // No bank code
    });
  });
}
