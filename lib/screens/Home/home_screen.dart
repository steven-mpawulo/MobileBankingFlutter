import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_banking/global/global.dart';
import 'package:mobile_banking/models/user.dart';
import 'package:mobile_banking/models/wallet.dart';
import 'package:mobile_banking/services/wallet/wallet_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  "Your Balance: ${formatBalance(walletService.wallet.balance)}",
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                );
              }),
              IconButton(
                  onPressed: () {
                    Provider.of<WalletService>(context, listen: false)
                        .reduceBalance(200.0);
                  },
                  icon: Icon(Icons.payment))
            ],
          ),
        ),
      ),
    );
  }
}
