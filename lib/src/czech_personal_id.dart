// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/**
 * [isCzechPersonalIdNumber] checks if the czech personal id number is valid.
 * @param idNumber can be in format ID/SUFFIX or IDSUFFIX
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

bool _isIdValid(String id) {
  // validate year
  final int yy = int.parse(id.trim().substring(0, 2));
  if (!(yy >= 0 && yy <= 99)) return false;

  // month can be month of birth + 20 or 50 or 70
  final int mm = int.parse(id.trim().substring(2, 4));
  if (!((mm >= 1 && mm <= 12) || (mm - 20 >= 1 && mm - 20 <= 12) || (mm - 50 >= 1 && mm - 50 <= 12) || (mm - 70 >= 1 && mm - 70 <= 12)))
    return false;

  // validate date
  final int dd = int.parse(id.trim().substring(4, 6));
  if (!(dd >= 1 && dd <= 31)) return false;

  return true;
}

/**
 * [_isSuffixValid] checks if the 4 digit suffix is valid.
 * In 3 digits suffix (IDs to the year 1954) checks only if it is not containing any non-digit chars.
 */
bool _isSuffixValid(String id) {
    String suffix = id.substring(6);

    // suffix must have max have 3 or 4 digits
    if (suffix.length < 3 || suffix.length > 4) return false;

    //  1) spočti zbytek po dělení prvních devíti číslic a čísla 11
    //  2) je-li zbytek 10, musí být poslední číslice 0
    //  3) jinak poslední číslice musí být rovna zbytku
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