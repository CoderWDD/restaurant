
import 'package:flutter/material.dart';
import 'package:restaurant/entities/User.dart';

class UserViewModel with ChangeNotifier{
  User _user;

  UserViewModel({required User user}): _user = user;

  User get user => _user;
  set user(User user){
    _user = user;
    notifyListeners();
  }

  void login(String username, String password){
    _user = User(username: username, password: password);
    notifyListeners();
  }
}