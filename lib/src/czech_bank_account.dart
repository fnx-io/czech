// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:mod97/mod97.dart';

bool isCzechBankAccount(final String bankAccountNumber, {withBankCode: true}) {
  final account = CzechBankAccount.fromString(bankAccountNumber);
  if(account.accountNumber == null) return false;
  if(withBankCode) {
    if(account.bankCode == null) return false;
  } else {
    if(account.bankCode != null) return false;
  }
  return true;
}

/**
 * Checks if the [bankAccountNumber] is valid czech bank account number.
 * [String bankAccountNumber] must be in format xxxxx-yyyyyyyyyy/zzzz (prefix and bank code are optional)
 * [bool withBankCode] flag stands for bank code after the slash (/)
 */
class CzechBankAccount {
  String _prefix;
  String get prefix => _prefix;

  String _accountNumber;
  String get accountNumber => _accountNumber;

  String _bankCode;
  String get bankCode => _bankCode;

  String _formattedAccount;
  String get formattedAccount => _formattedAccount;

  String _iban;
  String get iban => _iban;

  String _bic;
  get bic => _bic;
  
  final _accountRegExp = RegExp(r'^(([0-9]{1,6})\-)?([0-9]{2,10})(/([0-9]{4}))?$');

  CzechBankAccount.fromString(final String account) {
    final m = _accountRegExp.firstMatch(
        account?.replaceAll(' ', "")?.replaceAll("  ", "") ?? '');

    if(m == null) return;

    _prefix = m.group(2);
    if(_prefix != null && !_isValidNumberStructure(_prefix)) {
      _prefix = null;
      return;
    }
    _accountNumber = m.group(3);
    if(!_isValidNumberStructure(_accountNumber)) {
      _accountNumber = null;
      return;
    }

    _bankCode = m.group(5);

    _formattedAccount = (_prefix != null ?
    (int.tryParse(_prefix).toString() + "-") : "")
        + (int.tryParse(_accountNumber).toString())
        + (_bankCode != null ? ('/' + _bankCode)
            : '');

    if (_bankCode != null) _bic = _bankCodes[_bankCode];

    if (_bic != null && _accountNumber != null) {
      final ib = _bankCode
          + (_prefix ?? "0").padLeft(6, '0')
          + _accountNumber.padLeft(10, '0');

      final di = 98 - mod97(ib + "123500");
      _iban = 'CZ' + di.toString().padLeft(2, '0') + ib;
    }
  }

  String toString() => _formattedAccount;

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

  static final Map <String, String> _bankCodes = {
    "0100": "KOMBCZPP",
    "0300": "CEKOCZPP",
    "0600": "AGBACZPP",
    "0710": "CNBACZPP",
    "0800": "GIBACZPX",
    "2010": "FIOBCZPP",
    "2020": "BOTKCZPP",
    "2030": null,
    "2060": "CITFCZPP",
    "2070": "MPUBCZPP",
    "2100": null,
    "2200": null,
    "2220": "ARTTCZPP",
    "2240": "POBNCZPP",
    "2250": "CTASCZ22",
    "2260": null,
    "2275": null,
    "2600": "CITICZPX",
    "2700": "BACXCZPP",
    "3030": "AIRACZPP",
    "3050": "BPPFCZP1",
    "3060": "BPKOCZPP",
    "3500": "INGBCZPP",
    "4000": "EXPNCZPP",
    "4300": "CMZRCZP1",
    "5500": "RZBCCZPP",
    "5800": "JTBPCZPP",
    "6000": "PMBPCZPP",
    "6100": "EQBKCZPP",
    "6200": "COBACZPX",
    "6210": "BREXCZPP",
    "6300": "GEBACZPP",
    "6700": "SUBACZPP",
    "6800": "VBOECZ2X",
    "7910": "DEUTCZPX",
    "7940": "SPWTCZ21",
    "7950": null,
    "7960": null,
    "7970": null,
    "7980": null,
    "7990": null,
    "8030": "GENOCZ21",
    "8040": "OBKLCZ2X",
    "8060": null,
    "8090": "CZEECZPP",
    "8150": "MIDLCZPP",
    "8190": null,
    "8198": "FFCSCZP1",
    "8199": "MOUSCZP2",
    "8200": null,
    "8215": null,
    "8220": "PAERCZP1",
    "8225": "ORRRCZP1",
    "8230": "EEPSCZPP",
    "8240": null,
    "8250": "BKCHCZPP",
    "8255": "COMMCZPP",
    "8260": "PYYMCZPP",
    "8265": "ICBKCZPP",
    "8270": "FAPOCZP1",
    "8272": null,
    "8280": "BEFKCZP1",
    "8282": "BPORCZ22",
    "8283": "QPSRCZPP",
    "8291": null,
    "8292": null,
    "8293": null,
    "8294": null,
    "8296": null,
  };
}