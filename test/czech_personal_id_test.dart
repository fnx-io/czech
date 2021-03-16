// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:czech/czech.dart';
import 'package:test/test.dart';

void main() {
  group('Tests for personal id validation', () {
    test('Below inputs should be evaluated as valid personal id numbers', () {
      expect(isCzechPersonalIdNumber("740104/0020"), isTrue);
      expect(isCzechPersonalIdNumber("725414/4337"), isTrue);
      expect(isCzechPersonalIdNumber("780123/3540"), isTrue); // spec. valid ID
      expect(isCzechPersonalIdNumber("650416/1433"), isTrue);
      expect(isCzechPersonalIdNumber("7401040020"), isTrue);
      expect(isCzechPersonalIdNumber("911109/9327"), isTrue);
      expect(isCzechPersonalIdNumber("951115/9779"), isTrue);
      expect(isCzechPersonalIdNumber("820611/0979"), isTrue);
      expect(isCzechPersonalIdNumber("710114/2939"), isTrue);
      expect(isCzechPersonalIdNumber("690409/2041"), isTrue);
      expect(isCzechPersonalIdNumber("610321/9364"), isTrue);
      expect(isCzechPersonalIdNumber("535402/756"), isTrue);
      expect(isCzechPersonalIdNumber("410109/306"), isTrue);
      expect(isCzechPersonalIdNumber("410109/306"), isTrue);
      expect(isCzechPersonalIdNumber("320325/190"), isTrue);
      expect(isCzechPersonalIdNumber("305510/720"), isTrue);
      expect(isCzechPersonalIdNumber("175510/720"), isTrue);
      expect(isCzechPersonalIdNumber("175510/7200"), isTrue);
      expect(isCzechPersonalIdNumber("0002231010"), isTrue);
      expect(isCzechPersonalIdNumber("1602291010"), isTrue); // leap year
      expect(isCzechPersonalIdNumber("2002291016"), isTrue); // leap year
      expect(isCzechPersonalIdNumber("5202291017"), isTrue); // leap year
    });

    test('Below inputs should be evaluated as invalid personal id numbers', () {
      expect(isCzechPersonalIdNumber(""), isFalse);
      expect(isCzechPersonalIdNumber("1darek/0000"), isFalse);
      expect(isCzechPersonalIdNumber("##(*)(/@@@@"), isFalse);
      expect(isCzechPersonalIdNumber("0021"), isFalse);
      expect(isCzechPersonalIdNumber("/0021"), isFalse);
      expect(isCzechPersonalIdNumber("7401041/"), isFalse);
      expect(isCzechPersonalIdNumber("7401041"), isFalse);
      expect(isCzechPersonalIdNumber("740104/0021"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("740104/21"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("7401041/0021"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("238746370"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("873488373"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("2387437733"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("2387437733"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("3232872873"), isFalse); // invalid structure
      expect(isCzechPersonalIdNumber("8811200976"), isFalse); // invalid structure
      expect(
          isCzechPersonalIdNumber("540101123"), isFalse); // from year 1954 every personal ID must be with control digit
      expect(isCzechPersonalIdNumber("8002301010"), isFalse); // invalid date
      expect(isCzechPersonalIdNumber("1705741015"), isFalse); // invalid date
      expect(isCzechPersonalIdNumber("8702291114"), isFalse); // invalid date
      expect(isCzechPersonalIdNumber("8700291114"), isFalse); // invalid date
      expect(isCzechPersonalIdNumber("0006311019"), isFalse); // invalid date
      expect(isCzechPersonalIdNumber("1702291019"), isFalse); // not a leap year
      expect(isCzechPersonalIdNumber("2102291015"), isFalse); // not a leap year
      expect(isCzechPersonalIdNumber("5302291016"), isFalse); // not a leap year
      expect(isCzechPersonalIdNumber("16/03/201x1"), isFalse); // contains invalid characters
      expect(isCzechPersonalIdNumber("1603201x1"), isFalse); // contains invalid characters
    });
  });
}
