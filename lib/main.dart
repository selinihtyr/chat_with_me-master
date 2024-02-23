import 'dart:io';

import 'package:chat_with_me/pages/landing_page.dart';
import 'package:chat_with_me/services/firebase_auth_services.dart';
import 'package:chat_with_me/services/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

    Platform.isAndroid ?
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        appId: '1:765679528637:android:554242dd23e6dab8b5e5d4',
        messagingSenderId: '765679528637',
        projectId: 'chatwithme-4ad61',
        apiKey: "AIzaSyA2BBjXEIIpNO6CNT-sGSmbOvmxP9CScb0"
    )) : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LandingPage(),
    );
  }
}