import 'package:chat_with_me/pages/home_page.dart';
import 'package:chat_with_me/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/user_view_model.dart';

enum FormType { REGISTER, LOGIN }

class EmailPasswordSigninAndSignUp extends StatefulWidget {
  const EmailPasswordSigninAndSignUp({super.key});

  @override
  State<EmailPasswordSigninAndSignUp> createState() =>
      _EmailPasswordSigninAndSignUpState();
}

class _EmailPasswordSigninAndSignUpState
    extends State<EmailPasswordSigninAndSignUp> {
  late String _email, _password;
  late String _buttonText, _linkText;
  var _formType = FormType.LOGIN;
  final _formKey = GlobalKey<FormState>();

  _formSubmit() async {
    _formKey.currentState!.save();
    debugPrint('Email: $_email, Password: $_password');
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    if (_formType == FormType.LOGIN) {
      _userViewModel.signInWithEmailAndPassword(_email, _password);
    } else {
      _userViewModel.createUserWithEmailAndPassword(_email, _password);
    }
  }

  _change() {
    setState(() {
      _formType =
          _formType == FormType.LOGIN ? FormType.REGISTER : FormType.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buttonText = _formType == FormType.LOGIN ? 'Sign In' : 'Sign Up';
    _linkText = _formType == FormType.LOGIN
        ? 'No Account? Sign Up!'
        : 'Do you have an account? Sign In!';

    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);

      if(_userViewModel.user != null){
        Future.delayed(Duration(milliseconds: 10), () {
          Navigator.of(context).pop();
        });
      }


    return Scaffold(
        appBar: AppBar(title: const Text('Sign In / Sign Up')),
        backgroundColor: Colors.grey.shade200,
        body: _userViewModel.state == ViewState.IDLE
            ? SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        onSaved: (String? enteredEmail) {
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
                        onSaved: (String? enteredPassword) {
                          _password = enteredPassword!;
                        },
                      ),
                      const SizedBox(height: 8),
                      SocialLoginButton(
                        onPressed: () => _formSubmit(),
                        buttonColor: Colors.grey,
                        text: _buttonText,
                        height: 50,
                        fontSize: 18,
                        icon: null,
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () => _change(),
                        child: Text(_linkText),
                      ),
                    ]),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
