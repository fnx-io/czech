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
  // validate characters
  if (int.tryParse(id) == null) {
    return false;
  }

  // validate year
  final int y = int.parse(id.trim().substring(0, 2));
  if (!(y >= 0 && y <= 99)) return false;

  // validate month
  final int m = int.parse(id.trim().substring(2, 4));
  final int mNormalized = _normalizeMonth(m);
  if (mNormalized < 1 || mNormalized > 12) return false;

  // validate date
  final int d = int.parse(id.trim().substring(4, 6));
  return _isValidDate(d, mNormalized, 2000 + y);
}

bool _isValidDate(final int d, final int m, final int yyyy) {
  try {
    final dt = new DateTime(yyyy, m, d);
    return dt.month == m;
  } catch (e) {
    return false;
  }
}

/**
* Returns normalized month that begin at 1.
* [int mm] month of birth or +20 or +50 or +70
*/
int _normalizeMonth(final int mm) {
  if (mm >= 70) return mm - 70;
  if (mm >= 50) return mm - 50;
  if (mm >= 20) return mm - 20;
  return mm;
}

/**
 * [_isSuffixValid] implements algorithm for personal ID number validation.
 * [ref link]: https://phpfashion.com/jak-overit-platne-ic-a-rodne-cislo
 *
 * [String id] of personal ID number in format xxxxxxxxxx
 */
bool _isSuffixValid(final String id) {
  String suffix = id.substring(6);
  int year = int.parse(id.trim().substring(0, 2));
  // suffix must have 3 (id before 1954) or 4 digits (id after 1954)
  if ((suffix.length == 3 && year >= 54) ||
      suffix.length < 3 ||
      suffix.length > 4) return false;

  // personal ID algorithm validation
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
