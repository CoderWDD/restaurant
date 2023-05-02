
import 'package:flutter/material.dart';
import 'package:restaurant/base/api_response.dart';
import 'package:restaurant/base/base_repository.dart';
import 'package:restaurant/base/view_state.dart';

abstract class BaseViewModel<T extends BaseRepository, DataType> with ChangeNotifier{
  late T repository;
  T createRepository();

  Future<void> getDataList();


  List<DataType> dataList = [];
  int currentPage = 1;
  int pageSize = 10;
  bool hasMoreData = true;

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