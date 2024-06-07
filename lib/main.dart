import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/Auth/login_screen.dart';
import 'package:mobile_banking/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService()),
  ], child: const MobileBanking()));
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
