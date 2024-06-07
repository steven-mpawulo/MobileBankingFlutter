import 'package:flutter/foundation.dart';
import 'package:mobile_banking/models/wallet.dart';

class WalletService extends ChangeNotifier {
  final Wallet wallet =
      Wallet(id: 1, accountNumber: 1, balance: 2000, userId: 1);

  void reduceBalance(double amount) {
    double initialBalance = wallet.balance;
    double newBalance = initialBalance - amount;
    wallet.balance = newBalance;
    notifyListeners();
  }
}
