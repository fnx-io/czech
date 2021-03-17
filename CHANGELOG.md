# Changelog

## 3.0.2
- pedantic

## 3.0.0
- null safe

## 2.6.0
- more validation (no API changes)

## 2.1.0
- refactored to CzechAccountNumber class with .fromString constructor
- backward compatible isCzechBankAccount() method
- account sting is validated with RegExp
- BIC is looked up from a static map taken from https://www.cnb.cz/en/payments/iban/iban-calculator-czech-republic/
- formattedAccount, bic and iban are available if successfully instantiated
- if .formattedAccount is null or .accountNumber is null => not a valid czech account

## 2.0.0
- Nothing! 

## 1.0.0
- upgrade to Dart2

## 0.1.1

- Initial version, created by Stagehand
- Czech validators
