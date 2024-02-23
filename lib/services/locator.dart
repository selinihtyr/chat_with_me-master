import 'package:chat_with_me/services/fake_authentication_service.dart';
import 'package:chat_with_me/services/firebase_auth_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator= GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => FirebaseAuthServices());
  locator.registerLazySingleton(() => FakeAuthenticationService());
}
