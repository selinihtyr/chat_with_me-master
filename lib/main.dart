import 'dart:io';

import 'package:chat_with_me/pages/landing_page.dart';
import 'package:chat_with_me/services/locator.dart';
import 'package:chat_with_me/viewmodel/user_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:765679528637:android:554242dd23e6dab8b5e5d4',
      messagingSenderId: '765679528637',
      projectId: 'chatwithme-4ad61',
      apiKey: "AIzaSyA2BBjXEIIpNO6CNT-sGSmbOvmxP9CScb0",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => UserViewModel(),
        child: LandingPage(),
      ),
    );
  }
}