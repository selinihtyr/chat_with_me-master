import 'package:chat_with_me/model/user_app.dart';
import 'package:chat_with_me/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = '1234567890';
  @override
  Future<AppUser> currentUser() async {
    return await Future.value(AppUser(uid: userID));
  }

  @override
  Future<AppUser> signInAnonymously() async{
    return await Future.delayed(const Duration(seconds: 2), () => AppUser(uid: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<AppUser?> signInWithGoogle() {
    return Future.value(AppUser(uid: userID));
  }

  @override
  Future<AppUser?> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}