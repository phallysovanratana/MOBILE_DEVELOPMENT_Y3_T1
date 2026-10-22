class BankAccount {
  // TODO
  final String _accCode;
  String _username;
  double _balance;

  BankAccount(this._accCode, this._username, this._balance);

  String getAccCode() => _accCode;
  String getUsername() => _username;
  double getbalance() => _balance;

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception("Invalid amount!");
    } else {
      _balance -= amount;
    }
  }

  void credit(double amount) {
    if (amount < 0) {
      throw Exception("Amount must be > 0");
    } else {
      _balance += amount;
    }
  }
}

class Bank {
  // TODO
  String _bankName;
  List<BankAccount> _accounts = [];

  Bank(this._bankName);

  BankAccount createAccount(String accCode, String username, double? balance) {
    for (var acc in _accounts) {
      if (acc._accCode == accCode) {
        throw Exception("This account already exists!");
      }
    }

    BankAccount account = BankAccount(accCode, username, balance ?? 0.0);

    _accounts.add(account);

    return account;
  }

  String get bankName => _bankName;
}

void main() {
  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount('1', 'Ronan', 100.0);

  print(ronanAccount.getbalance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.getbalance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.getbalance()); // Balance: $50

  try {
    ronanAccount.withdraw(900.0); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount('1', 'Honlgy', 0.0); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}



  