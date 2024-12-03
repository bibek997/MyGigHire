import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gighire/Services/Auth/Login_and_Register.dart';
import 'package:gighire/Chat%20UI/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User is logged in
          if (snapshot.hasData) {
            return HomePage();
          }

          //User is Not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
