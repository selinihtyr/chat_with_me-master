import 'package:chat_with_me/model/user_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_base.dart';
import '../services/firebase_auth_services.dart';
import '../services/locator.dart';

class HomePage extends StatelessWidget {
  final User user;
  AuthBase authService = locator<FirebaseAuthServices>();
  final VoidCallback onSignOut;

  HomePage({super.key, required this.onSignOut ,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              _logout();
            },
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

  Future<void> _logout() async {
    await authService.signOut();
    onSignOut();
  }
}
