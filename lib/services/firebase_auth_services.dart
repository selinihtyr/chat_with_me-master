import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_app.dart';
import 'auth_base.dart';

class FirebaseAuthServices implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> currentUser() async {
    try{
      User? user = await _firebaseAuth.currentUser;
      return _userFromFirebase(user!);
    } catch (e) {
      print("Error from currentUser: $e");
      return null;
    }
  }

  AppUser? _userFromFirebase(User? user) {
    if (user == null) return null;
    return AppUser(uid: user.uid);
  }

  @override
  Future<AppUser?> signInAnonymously() async{
    try{
      UserCredential result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(result.user);
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

  @override
  Future<AppUser?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}