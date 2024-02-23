
import 'package:chat_with_me/pages/sign_in.dart';
import 'package:chat_with_me/services/auth_base.dart';
import 'package:chat_with_me/services/firebase_auth_services.dart';
import 'package:chat_with_me/services/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {

  @override
  State<LandingPage> createState() => _LandingUserState();
}

class _LandingUserState extends State<LandingPage> {
  User? _user;
  AuthBase authService = locator<FirebaseAuthServices>();

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignIn(
      onSignIn: (user){
        _updateUser(user);
      },);
    } else {
      return HomePage(
      user: _user!,
        onSignOut: (){
          _updateUser(null);
        },
      );
    }
  }

  void _checkUser() async {
    User? user = (await authService.currentUser()) as User?;
    _updateUser(user);
  }

  void _updateUser(User? user){
    setState(() {
      _user = user;
    });
  }
}
