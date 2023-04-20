
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/repository/auth_repository.dart';

class AuthViewModel extends BaseViewModel<AuthRepository>{
  static String token = '';

  @override
  AuthRepository createRepository() => AuthRepository();

  // write auth key to secure storage
  void saveToken(String token) {
    AuthViewModel.token = token;
    repository.saveToken(token);
  }

  // get auth key from secure storage
  Future<String> getToken() async{
    var token = await repository.getAuthToken();
    AuthViewModel.token = token;
    return token;
  }

  // delete auth key from secure storage
  Future<void> deleteToken() => repository.deleteToken();
}