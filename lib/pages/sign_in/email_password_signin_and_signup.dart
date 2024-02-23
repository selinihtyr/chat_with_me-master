import 'package:flutter/material.dart';

class EmailPasswordSigninAndSignUp extends StatefulWidget {
  const EmailPasswordSigninAndSignUp({super.key});

  @override
  State<EmailPasswordSigninAndSignUp> createState() =>
      _EmailPasswordSigninAndSignUpState();
}

class _EmailPasswordSigninAndSignUpState
    extends State<EmailPasswordSigninAndSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In / Sign Up')
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Text('Form'),
      )
    );
  }
}
