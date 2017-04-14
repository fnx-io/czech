# czech

Set of Czechia-specific Dart functions.

At this point - validation of frequently used values:

- personal ID (rodné číslo)
- company ID (IČ)
- bank account (číslo účtu)

## Usage

A simple usage example:

    import 'package:czech/czech.dart' as cz;
    
    main() {
    
      // a.k.a Rodné číslo
      if (cz.isCzechPersonalIdNumber("780324/6543")) {
        print("Valid!");
      }
    
      // a.k.a. IČ
      if (cz.isCzechCompanyIdNumber("04626133")) {
        print("Valid!");
      }
    
      // a.k.a. Číslo účtu - with bank code by default
      if (cz.isCzechBankAccount("3033/2700")) {
        print("Valid!");
      }
    
      // a.k.a. Číslo účtu - without a bank code
      if (cz.isCzechBankAccount("3033", withBankCode: false)) {
        print("Valid!");
      }
    
    }

## Attributions

Based on analysis by David Grudl: https://phpfashion.com/jak-overit-platne-ic-a-rodne-cislo

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/fnx-io/czech/issues
