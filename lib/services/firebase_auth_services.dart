

import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_app.dart';
import 'auth_base.dart';

class FirebaseAuthServices implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return AppUser(uid: user.uid);
  }

  @override
  Future<AppUser?> currentUser() async {
    try{
      User? user = _firebaseAuth.currentUser;
      return _userFromFirebase(user!);
    } catch (e) {
      print("Error from currentUser: $e");
    }
    return null;
  }

  @override
  Future<AppUser?> signInAnonymously() async{
    try{
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      print("Error from signInAnonymously: $e");
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    try{
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Error from signOut: $e");
      return false;
    }
  }
}