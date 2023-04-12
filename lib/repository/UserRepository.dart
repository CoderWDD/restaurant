import 'package:restaurant/network/RestaurantDio.dart';

import '../entities/User.dart';

class UserRepository{
  void login(User user){
    RestaurantDio().dio.post(
      "/login",
      data: user,
    );
  }
}