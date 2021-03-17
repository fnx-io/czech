// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:czech/czech.dart' as cz;

void main() {
  // a.k.a Rodné číslo
  if (cz.isCzechPersonalIdNumber('780324/6543')) {
    print('Valid!');
  }

  // a.k.a. IČ
  if (cz.isCzechCompanyIdNumber('04626133')) {
    print('Valid!');
  }

  // a.k.a. Číslo účtu - with bank code by default
  if (cz.isCzechBankAccount('3033/2700')) {
    print('Valid!');
  }

  // a.k.a. Číslo účtu - without a bank code
  if (cz.isCzechBankAccount('3033', withBankCode: false)) {
    print('Valid!');
  }
}
