import 'package:chat_with_me/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class EmailPasswordSigninAndSignUp extends StatefulWidget {
  const EmailPasswordSigninAndSignUp({super.key});

  @override
  State<EmailPasswordSigninAndSignUp> createState() =>
      _EmailPasswordSigninAndSignUpState();
}

class _EmailPasswordSigninAndSignUpState
    extends State<EmailPasswordSigninAndSignUp> {

  late String _email, _password;
  final _formKey = GlobalKey<FormState>();

  _formSubmit(BuildContext context) {
      _formKey.currentState!.save();
      debugPrint('Email: $_email, Password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sign In / Sign Up')),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  key: _formKey,
                  children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onSaved: (String? enteredEmail){
                    _email = enteredEmail!;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onSaved: (String? enteredPassword){
                    _password = enteredPassword!;
                  },
                ),
                const SizedBox(height: 8),
                SocialLoginButton(
                  onPressed: () => _formSubmit(context),
                  buttonColor: Colors.grey,
                  text: 'Sign In',
                  height: 50,
                  fontSize: 18, icon: null,
                  
                ),
              ]),
            ),
          ),
        ));
  }
}
