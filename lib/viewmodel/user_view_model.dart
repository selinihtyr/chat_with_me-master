import 'package:chat_with_me/model/user_app.dart';
import 'package:chat_with_me/repository/user_repository.dart';
import 'package:chat_with_me/services/auth_base.dart';
import 'package:chat_with_me/services/locator.dart';
import 'package:flutter/material.dart';

enum ViewState {IDLE, BUSY}

class UserViewModel with ChangeNotifier implements AuthBase{
  ViewState _state = ViewState.IDLE;
  UserRepository _userRepository = locator<UserRepository>();
  AppUser? _user;

  AppUser? get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserViewModel(){
    currentUser();
  }

  @override
  Future<AppUser?> currentUser() async{
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("View Model Current User Hata: " + e.toString());
      return null;
    } finally {
      state = ViewState.IDLE;
    }
  }

  @override
  Future<AppUser?> signInAnonymously()async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.signInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("View Model Current User Hata: " + e.toString());
      return null;
    } finally {
      state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> signOut() async{
    try {
      state = ViewState.BUSY;
      bool result = await _userRepository.signOut();
      _user = null;
      return result;
    } catch (e) {
      debugPrint("View Model Current User Hata: " + e.toString());
      return false;
    } finally {
      state = ViewState.IDLE;
    }
  }

  @override
  Future<AppUser?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}