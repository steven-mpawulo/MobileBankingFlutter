import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/Auth/login_screen.dart';

void main() {
  runApp(const MobileBanking());
}

class MobileBanking extends StatelessWidget {
  const MobileBanking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        theme: ThemeData(
          useMaterial3: true,
        ));
  }
}
