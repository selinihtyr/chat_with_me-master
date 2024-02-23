 import 'package:chat_with_me/services/auth_base.dart';
import 'package:chat_with_me/services/fake_authentication_service.dart';
import 'package:chat_with_me/services/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/social_login_button.dart';

class SignIn extends StatelessWidget {
  final Function(User) onSignIn;
  AuthBase authService = locator<FakeAuthenticationService>();

  SignIn({Key? key, required this.onSignIn}) : super(key: key);

  void _signInAnonymously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    onSignIn(userCredential.user!);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xff6A5BC2);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat Lover'),
          elevation: 0.0,
          backgroundColor: primaryColor,
        ),
        backgroundColor: Colors.grey.shade200,
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SocialLoginButton(
                onPressed: () {},
                buttonColor: Colors.red,
                text: 'Login With Gmail',
                height: 50,
                icon: const Icon(Icons.email),
                fontSize: 18,
              ),
              SocialLoginButton(
                onPressed: () {},
                buttonColor: const Color(0xff334D92),
                text: 'Login With Facebook',
                height: 50,
                icon: const Icon(Icons.email),
                fontSize: 18,
              ),
              SocialLoginButton(
                onPressed: () {},
                buttonColor: Colors.purple,
                text: 'Login With Email and Password',
                height: 50,
                icon: const Icon(Icons.email),
                fontSize: 18,
              ),
              SocialLoginButton(
                onPressed: () {
                  print("Butona tıklandı");
                  _signInAnonymously();
                },
                buttonColor: Colors.grey,
                text: 'Guest Login',
                height: 50,
                icon: const Icon(Icons.supervised_user_circle),
                fontSize: 18,
              ),
            ],
          ),
        ));
  }
}
