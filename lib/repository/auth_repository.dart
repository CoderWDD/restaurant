
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant/base/base_repository.dart';

class AuthRepository extends BaseRepository{
  final String _authKey = 'auth_key';
  static const storage = FlutterSecureStorage();

  // use secure storage to store the token
  void saveToken(String token) async{
    await storage.write(key: _authKey, value: token);
  }

  // get the token from secure storage
  Future<String> getAuthToken() async{
    return await storage.read(key: _authKey) ?? '';
  }

  // delete the token from secure storage
  Future<void> deleteToken() async{
    await storage.delete(key: _authKey);
  }

  // check if the token is valid
  Future<bool> isTokenValid() async{
    var token = await getAuthToken();
    return token != null;
  }
}