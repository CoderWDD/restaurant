
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/repository/favorite_repository.dart';

class HomeFavoriteListProvider extends BaseViewModel<FavoriteRepository>{
  @override
  FavoriteRepository createRepository() => FavoriteRepository();



}