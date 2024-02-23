import '../model/user_app.dart';

abstract class AuthBase {
  Future<AppUser?> currentUser();
  Future<AppUser?> signInAnonymously();
  Future<bool> signOut();
  Future<AppUser?> signInWithGoogle();
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);
  Future<AppUser?> createUserWithEmailAndPassword(String email, String password);
}