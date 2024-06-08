class Transaction {
  int id;
  double amount;
  String description;
  DateTime date;
  int walletId;
  int userId;

  Transaction(
      {required this.id,
      required this.amount,
      required this.description,
      required this.date,
      required this.walletId,
      required this.userId});
}
