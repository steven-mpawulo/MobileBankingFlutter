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

String formatAmount(double balance) {
  NumberFormat formatter = NumberFormat("#,###.#");
  String formattedBalance = formatter.format(balance);
  return formattedBalance;
}

String formatDate(String unformattedDate) {
  DateTime date = DateTime.parse(unformattedDate);
  String dd = date.day.toString().padLeft(2, '0');
  String mm = date.month.toString().padLeft(2, '0');
  int yyyy = date.year;
  return '$mm/$dd/$yyyy';
}
