// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/**
 * Checks if the [bankAccountNumber] is valid czech bank account number.
 * [String bankAccountNumber] must be in format xxxxx-yyyyyyyyyy/zzzz (prefix and bank code are optional)
 * [bool withBankCode] flag stands for bank code after the slash (/)
 */
bool isCzechBankAccount(final String bankAccountNumber, {withBankCode: true}) {
  String prefix;
  String accountNumber;
  String bankCode;
  try {
    accountNumber = bankAccountNumber.replaceAll(" ", "");
    // Get prefix is exists
    if (bankAccountNumber.contains("-")) {
      int prefixIndex = accountNumber.indexOf("-");
      prefix = accountNumber.substring(0, prefixIndex);
      accountNumber = accountNumber.substring(prefixIndex + 1);
    }
    // Get bank code if exists
    if (withBankCode) {
      int slashIndex = accountNumber.indexOf('/');
      bankCode = accountNumber.substring(slashIndex + 1);
      accountNumber = accountNumber.substring(0, slashIndex);
    }
    return _isValidAccount(accountNumber, prefix, bankCode);
  } catch (e) {
    return false;
  }
}

bool _isValidAccount(String accountNumber, [String prefix, String bankCode]) {
  // prefix validation
  if (prefix != null && !_isValidPrefix(prefix)) return false;

  // account number validation
  if (!_isValidAccountNumber(accountNumber)) return false;

  // bank code validation
  if (bankCode != null && !_isValidBankCode(bankCode)) return false;

  return true;
}

bool _isValidPrefix(String prefix) {
  // Invalid prefix number structure
  if (!_isValidNumberStructure(prefix)) return false;

  return true;
}

bool _isValidAccountNumber(String accountNumber) {
  // Invalid length of account number
  if (accountNumber.length > 10 || accountNumber.length < 2) return false;

  // Invalid account number structure
  if (!_isValidNumberStructure(accountNumber)) return false;

  return true;
}

bool _isValidBankCode(String bankCode) => bankCode.length == 4;

/**
 * [_isValidNumberStructure] implements a Modulus 11-check algorithm with weights used to validate the account number structure.
 * [ref link]: http://www.cnb.cz/cs/platebni_styk/iban/download/TR201.pdf (page 40)
 *
 * [String number] of prefix or account number
 */
bool _isValidNumberStructure(String number) {
  const List<int> weights = const [1, 2, 4, 8, 5, 10, 9, 7, 3, 6];
  int tmp, j, i;
  tmp = j = 0;
  for (i = number.length; i > 0; i--) {
    tmp += weights[j] * (int.parse(number.substring(i - 1, i)));
    j++;
  }
  if (tmp % 11 != 0) {
    return false;
  }
  return true;
}
