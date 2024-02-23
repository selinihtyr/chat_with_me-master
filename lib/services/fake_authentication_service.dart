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
}