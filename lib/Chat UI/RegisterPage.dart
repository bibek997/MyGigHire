import 'package:flutter/material.dart';
import 'package:gighire/Services/Auth/auth_service.dart';
import 'package:gighire/Components/Button.dart';
import 'package:gighire/Components/text_field.dart';

class Registerpage extends StatelessWidget {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  //tap to go to login page
  final void Function()? onTap;

  Registerpage({super.key, required this.onTap});

  //register method
  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();

    //password match = create New user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    //password don't match = show error to user to fix

    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and Tagline
            const SizedBox(height: 40),
            const Text(
              'GigHire',
              style: TextStyle(
                color: Color(0xFF4CAF50),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Create your account',
              style: TextStyle(color: Color(0xFF888888), fontSize: 16),
            ),

            const SizedBox(height: 25),

            //email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            //Pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 10),

            //Confirm Pw textfield
            MyTextfield(
              hintText: "Conform Password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(height: 10),

            // Register button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            // Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
