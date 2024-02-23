import '../model/user_app.dart';

abstract class AuthBase {
  Future<AppUser?> currentUser();
  Future<AppUser?> signInAnonymously();
  Future<bool> signOut();
  Future<AppUser?> signInWithGoogle();
}