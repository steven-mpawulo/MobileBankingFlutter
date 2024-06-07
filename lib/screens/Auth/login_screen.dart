import 'package:flutter/material.dart';
import 'package:mobile_banking/components/MyTextInput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
              const Text(
                "Mobile Banking",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter your details to sign in",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextInput(
                      label: "Email",
                      textEditingController: _email,
                      forPassword: false,
                      hintText: "johndoe@gamil.com",
                    ),
                    MyTextInput(
                      label: "Password",
                      textEditingController: _password,
                      forPassword: true,
                      hintText: "******",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
