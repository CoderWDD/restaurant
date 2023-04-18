
import 'package:flutter/material.dart';
import 'package:restaurant/base/api_response.dart';
import 'package:restaurant/base/base_repository.dart';
import 'package:restaurant/base/view_state.dart';

abstract class BaseViewModel<T extends BaseRepository> with ChangeNotifier{
  late T repository;
  T createRepository();

  ViewState viewState = ViewState.loading;

  BaseViewModel(){
    repository = createRepository();
  }

  void setViewState(ViewState viewState){
    this.viewState = viewState;
    notifyListeners();
  }

  void setViewStateByRes<Type>(ApiResponse<Type> response, {int successCode = 200}){
    if(response.code == successCode){
      setViewState(ViewState.success);
    } else {
      setViewState(ViewState.error);
    }
  }
}