import 'package:chat_with_me/model/user_app.dart';
import 'package:chat_with_me/services/auth_base.dart';
import 'package:chat_with_me/services/fake_authentication_service.dart';
import 'package:chat_with_me/services/firebase_auth_services.dart';
import 'package:chat_with_me/services/locator.dart';

enum AppMode { DEBUG, RELEASE }

FirebaseAuthServices _firebaseAuthServices = locator<FirebaseAuthServices>();
FakeAuthenticationService _fakeAuthenticationService =
    locator<FakeAuthenticationService>();
AppMode appMode = AppMode.DEBUG;

class UserRepository implements AuthBase {

  @override
  Future<AppUser?> currentUser() async {
    if (appMode == AppMode.DEBUG)  {
      return await _fakeAuthenticationService.currentUser();
    } else {
      return await _firebaseAuthServices.currentUser();
    }
  }

  @override
  Future<AppUser?> signInAnonymously() async{
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInAnonymously();
    } else {
      return await _firebaseAuthServices.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthServices.signOut();
    }
  }

  @override
  Future<AppUser?> signInWithGoogle()async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithGoogle();
    } else {
      return await _firebaseAuthServices.signInWithGoogle();
    }
  }
}
