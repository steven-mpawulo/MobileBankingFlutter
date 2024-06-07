import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

SnackBar showSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
}

String formatBalance(double balance) {
  NumberFormat formatter = NumberFormat("#,###.#");
  String formattedBalance = formatter.format(balance);
  return formattedBalance;
}
