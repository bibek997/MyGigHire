import 'package:flutter/material.dart';
import 'package:gighire/Chat%20UI/LoginPage.dart';
import 'package:gighire/Chat%20UI/RegisterPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show loginpage
  bool showLoginPage = true;

  //toggle between logina and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(
        onTap: togglePages,
      );
    } else {
      return Registerpage(
        onTap: togglePages,
      );
    }
  }
}
