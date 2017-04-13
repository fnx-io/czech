// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:czech/czech.dart';
import 'package:test/test.dart';

void main() {
  group('Tests for bank accounts validation', () {
    test('Below inputs should be evaluated as valid personal id numbers', () {
      expect(isCzechPersonalIdNumber("740104/0020"), isTrue);
      expect(isCzechPersonalIdNumber("725414/4337"), isTrue);
      expect(isCzechPersonalIdNumber("740104/002"), isTrue);
      expect(isCzechPersonalIdNumber("780123/3540"), isTrue); // special but valid ID number
      expect(isCzechPersonalIdNumber("7401040020"), isTrue);
    });

    test('Below inputs should be evaluated as invalid personal id numbers', () {
      expect(isCzechPersonalIdNumber("740104/0021"), isFalse);
      expect(isCzechPersonalIdNumber("740104/21"), isFalse);
      expect(isCzechPersonalIdNumber("7401041/0021"), isFalse);
      expect(isCzechPersonalIdNumber("0021"), isFalse);
      expect(isCzechPersonalIdNumber("/0021"), isFalse);
      expect(isCzechPersonalIdNumber("7401041/"), isFalse);
      expect(isCzechPersonalIdNumber("7401041"), isFalse);
      expect(isCzechPersonalIdNumber(""), isFalse);
      expect(isCzechPersonalIdNumber(null), isFalse);
      expect(isCzechPersonalIdNumber("1darek/0000"), isFalse);
      expect(isCzechPersonalIdNumber("##(*)(/@@@@"), isFalse);
    });
  });
}
