import 'package:flutter/material.dart';
import 'package:mobile_banking/components/my_button.dart';
import 'package:mobile_banking/components/my_textInput.dart';
import 'package:mobile_banking/global/global.dart';
import 'package:mobile_banking/models/transaction.dart';
import 'package:mobile_banking/models/user.dart';
import 'package:mobile_banking/services/transaction/transaction_service.dart';
import 'package:mobile_banking/services/wallet/wallet_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${"${widget.user.firstName} ${widget.user.lastName}"}",
                style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Consumer<WalletService>(builder: (context, walletService, child) {
                return Text(
                  "Your Balance: ${formatAmount(walletService.wallet.balance)}",
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                );
              }),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    useSafeArea: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              children: [
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyTextInput(
                                        label: "Account Number",
                                        textEditingController: _accountNumber,
                                        forPassword: false,
                                        hintText: "1",
                                        icon: const Icon(Icons.account_balance),
                                      ),
                                      MyTextInput(
                                          label: "Amount",
                                          textEditingController: _amount,
                                          forPassword: false,
                                          hintText: "100",
                                          icon: const Icon(Icons.money)),
                                      MyTextInput(
                                          label: "Description",
                                          textEditingController: _description,
                                          forPassword: false,
                                          hintText: "your reason",
                                          icon: const Icon(Icons.message)),
                                      MyButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            Provider.of<WalletService>(context,
                                                    listen: false)
                                                .reduceBalance(
                                                    double.parse(_amount.text));
                                            Transaction transaction =
                                                Transaction(
                                                    id: 1,
                                                    amount: double.parse(
                                                        _amount.text),
                                                    description:
                                                        _description.text,
                                                    date: DateTime.now(),
                                                    walletId: 1,
                                                    userId: 1);

                                            Provider.of<TransactionService>(
                                                    context,
                                                    listen: false)
                                                .addTransaction(transaction);

                                            setState(() {
                                              isLoading = false;
                                            });

                                            _accountNumber.clear();
                                            _amount.clear();
                                            _description.clear();
                                            Navigator.pop(context);
                                          }
                                        },
                                        buttonText: "Pay Bill",
                                        isLoading: isLoading,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.payment), Text("Pay Bill")],
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "You transactions",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer<TransactionService>(
                  builder: (context, transactionService, child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      itemCount: transactionService.transactions.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Reason: "),
                                  Text(transactionService
                                      .transactions[index].description),
                                ],
                              ),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Amount: ",
                                  ),
                                  Text(formatAmount(transactionService
                                      .transactions[index].amount)),
                                ],
                              ),
                              trailing: Text(formatDate(transactionService
                                  .transactions[index].date
                                  .toString())),
                            ),
                            const Divider(),
                          ],
                        );
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
