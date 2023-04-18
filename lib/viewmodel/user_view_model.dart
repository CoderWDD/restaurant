
import 'package:flutter/material.dart';
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/base/view_state.dart';
import 'package:restaurant/entities/User.dart';
import 'package:restaurant/repository/user_repository.dart';

class UserViewModel extends BaseViewModel<UserRepository>{
  // user login method
  Future<void> login(String username, String password) async{
    setViewState(ViewState.loading);
    final user = User(username: username, password: password);
    var res = await repository.login(user);
    setViewStateByRes(res, successCode: 0);
    notifyListeners();
  }

  // user register method
  Future<void> register(String username, String password) async{
    setViewState(ViewState.loading);
    final user = User(username: username, password: password);
    var res = await repository.register(user);
    setViewStateByRes(res, successCode: 0);
    notifyListeners();
  }

  @override
  UserRepository createRepository() {
    return UserRepository();
  }
}