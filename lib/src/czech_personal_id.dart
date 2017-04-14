// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/**
 * Checks if the [idNumber] is valid czech personal ID number (Rodne cislo)
 * [String idNumber] must be in the format xxxxxx/xxxx or xxxxxxxxxx
  */
bool isCzechPersonalIdNumber(String idNumber) {
  try {
    idNumber = idNumber.replaceAll("/", "");
    idNumber = idNumber.replaceAll(" ", "");
    return _isIdValid(idNumber) && _isSuffixValid(idNumber);
  } catch (e) {
    return false;
  }
}

bool _isIdValid(final String id) {
  // validate year
  final int yy = int.parse(id.trim().substring(0, 2));
  if (!(yy >= 0 && yy <= 99)) return false;

  // month can be month of birth or +20 or +50 or +70
  final int mm = int.parse(id.trim().substring(2, 4));
  if (!((mm >= 1 && mm <= 12) ||
      (mm - 20 >= 1 && mm - 20 <= 12) ||
      (mm - 50 >= 1 && mm - 50 <= 12) ||
      (mm - 70 >= 1 && mm - 70 <= 12))) return false;

  // validate date
  final int dd = int.parse(id.trim().substring(4, 6));
  if (!(dd >= 1 && dd <= 31)) return false;

  return true;
}

/**
 * [_isSuffixValid] implements algorithm for personal ID number validation.
 * [ref link]: https://phpfashion.com/jak-overit-platne-ic-a-rodne-cislo
 *
 * [String id] of personal ID number in format xxxxxxxxxx
 */
bool _isSuffixValid(final String id) {
  String suffix = id.substring(6);
  // suffix must have max have 3 or 4 digits
  if (suffix.length < 3 || suffix.length > 4) return false;
  if (suffix.length == 4) {
    int firstNine = int.parse(id.substring(0, 9));
    int last = int.parse(id[9]);
    int result = firstNine % 11;
    if (result == 10) {
      if (last != 0) return false;
    } else {
      if (last != result) return false;
    }
  }
  return true;
}
