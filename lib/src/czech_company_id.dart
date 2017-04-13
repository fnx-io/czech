// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/**
 * Checks if the [idNumber] is valid company ID number (IČ or previously known as IČO number).
 * [String idNumber] must be in the format xxxxxxx
 */
bool isCzechCompanyIdNumber(String idNumber) {
  try {
    idNumber = idNumber.replaceAll(" ", "");
    return _isIdValid(idNumber);
  } catch (e) {
    return false;
  }
}

/// Algoritmus pro validaci IC/ICO:
/// 1. první až sedmou číslici vynásobíme čísly 8, 7, 6, 5, 4, 3, 2 a součiny sečteme;
/// 2. spočítáme zbytek po dělení jedenácti a pro poslední osmou číslici c musí platit:
///   * je-li zbytek 0, pak c = 1
///   * je-li zbytek 1, pak c = 0
///   * v ostatních případech je c = 11 - zbytek
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
