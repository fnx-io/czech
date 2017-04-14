// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/**
 * Checks if the [idNumber] is valid czech company ID number (IC or previously known as ICO number).
 * [String idNumber] of IC/ICO in format xxxxxxxx or xxx xx xxx
 */
bool isCzechCompanyIdNumber(String idNumber) {
  try {
    idNumber = idNumber.replaceAll(" ", "");
    return _isIdValid(idNumber);
  } catch (e) {
    return false;
  }
}

/**
 * [_isIdValid] implements algorithm for IC/ICO validation.
 * [ref link]: https://phpfashion.com/jak-overit-platne-ic-a-rodne-cislo
 *
 * [String idNumber] of IC/ICO in format xxxxxxxx
 */
bool _isIdValid(final String idNumber) {
  // must have 7 digits
  if (idNumber.length != 8) return false;

  // validation algorithm
  List<int> weights = const [8, 7, 6, 5, 4, 3, 2];
  int sum = 0;
  for (int i = 0; i < weights.length; i++) {
    sum += int.parse(idNumber[i]) * weights[i];
  }
  int remain = sum % 11;
  int c = int.parse(idNumber[7]);
  if (remain == 0) {
    if (c != 1) return false;
  } else if (remain == 1) {
    if (c != 0) return false;
  } else {
    if (c != (11 - remain)) return false;
  }
  return true;
}
