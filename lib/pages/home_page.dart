import 'package:chat_with_me/model/user_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/user_view_model.dart';

class HomePage extends StatelessWidget {
  final AppUser user;

  HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _logout(context) ,
            icon: const Icon(Icons.exit_to_app),
          )
        ],
        title: const Text('Chat Lover'),
        elevation: 0.0,
        backgroundColor: const Color(0xff6A5BC2),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Hoşgeldin ${user.uid}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ),
    );
  }

  Future<bool> _logout(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    bool result = await _userViewModel.signOut();
    return result;
  }
}
