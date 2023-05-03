
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/base/view_state.dart';
import 'package:restaurant/constants/router_constants.dart';
import 'package:restaurant/entities/user.dart';
import 'package:restaurant/repository/user_repository.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/viewmodel/auth_view_model.dart';

class UserViewModel extends BaseViewModel<UserRepository, Void>{
  late User _user;
  User get user => _user;
  set user(User user){
    _user = user;
    notifyListeners();
  }

  // user login method
  Future<String> login(String username, String password) async{
    setViewState(ViewState.loading);
    final user = User(username: username, password: password);
    var res = await repository.login(user);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      user.token = res.data!;
      _user = user;
      routers.go(HOME_ROUTE);
    }
    return res.data!;
  }

  // user register method
  Future<void> register(String username, String password, String phoneNumber) async{
    setViewState(ViewState.loading);
    final user = User(username: username, password: password, phone: phoneNumber);
    var res = await repository.register(user);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) routers.go(LOGIN_ROUTE);
  }

  @override
  UserRepository createRepository() {
    return UserRepository();
  }

  @override
  Future<void> getDataList() async{}
}