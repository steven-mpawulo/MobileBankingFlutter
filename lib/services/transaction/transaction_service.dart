import 'package:flutter/material.dart';
import 'package:mobile_banking/models/transaction.dart';

class TransactionService extends ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(
        id: 1,
        amount: 200,
        description: "sample",
        date: DateTime.now(),
        walletId: 1,
        userId: 1),
    Transaction(
        id: 1,
        amount: 100,
        description: "test",
        date: DateTime.now(),
        walletId: 1,
        userId: 1),
  ];

  void addTransaction(Transaction transaction) {
    transactions.insert(0, transaction);
    notifyListeners();
  }
}
