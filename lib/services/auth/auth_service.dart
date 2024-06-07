import 'package:flutter/material.dart';
import 'package:mobile_banking/models/user.dart';

class AuthService extends ChangeNotifier {
  final User _user = User(
      id: 1, firstName: "John", lastName: "Doe", email: "johndoe@test.com");

  User? signIn(String email, String password) {
    if (email == "johndoe@test.com" && password == "123456") {
      return _user;
    } else {
      return null;
    }
  }
}
