import 'package:chat_with_me/pages/sign_in/sign_in.dart';
import 'package:chat_with_me/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

    if (_userViewModel.state == ViewState.IDLE) {
      if (_userViewModel.user == null) {
        return SignIn();
      } else {
        return HomePage(user: _userViewModel.user!);
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
