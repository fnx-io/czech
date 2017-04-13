// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:czech/czech.dart';
import 'package:test/test.dart';

void main() {
  group('Tests for company id validation', () {
    test('Below inputs should be evaluated as valid company id numbers', () {
      expect(isCzechCompanyIdNumber("264 93 993"), isTrue);
      expect(isCzechCompanyIdNumber("24852104"), isTrue);
      expect(isCzechCompanyIdNumber("01993143"), isTrue);
      expect(isCzechCompanyIdNumber("01993143"), isTrue);
      expect(
          isCzechCompanyIdNumber("25596641"), isTrue); // special but valid ID
      expect(isCzechCompanyIdNumber("24287814"), isTrue);
      expect(isCzechCompanyIdNumber(" 0 5266 289 "), isTrue);
      expect(isCzechCompanyIdNumber(" 0 5266 289 "), isTrue);
      expect(isCzechCompanyIdNumber("25998137"), isTrue);
      expect(isCzechCompanyIdNumber("27183271"), isTrue);
      expect(isCzechCompanyIdNumber("28633482"), isTrue);
      expect(isCzechCompanyIdNumber("24846350"), isTrue);
    });

    test('Below inputs should be evaluated as invalid company id numbers', () {
      expect(isCzechCompanyIdNumber(""), isFalse);
      expect(isCzechCompanyIdNumber(null), isFalse);
      expect(isCzechCompanyIdNumber("1darek/0000"), isFalse);
      expect(isCzechCompanyIdNumber("883929483"), isFalse); // must be 8 digits
      expect(isCzechCompanyIdNumber("##(*)(/@@@@"), isFalse);
      expect(isCzechCompanyIdNumber("24846/50"), isFalse);
      expect(isCzechCompanyIdNumber("0"), isFalse);
      expect(isCzechCompanyIdNumber("00000000"), isFalse);
      expect(isCzechCompanyIdNumber("23231324"), isFalse);
    });
  });
}
