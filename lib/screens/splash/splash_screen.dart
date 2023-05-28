import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/buttons_widgets.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base/view_state.dart';
import '../../constants/assets_constants.dart';
import '../../viewmodel/auth_view_model.dart';
import '../../viewmodel/user_view_model.dart';

class SplashScreen extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;

  SplashScreen({Key? key, required this.onLoginPressed, required this.onRegisterPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userViewModel = Provider.of<UserViewModel>(context, listen: false);
    getUserInfoFromSharedPreferences(userViewModel = userViewModel, (token){
      // save token to secure storage
      var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      authViewModel.saveToken(token);
    });

    return Container(
      color: const Color(0xFFFFFCFA),
      padding: EdgeInsets.symmetric(horizontal: 24.px3pt),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 65.px3pt,
          ),
          SvgPicture.asset(
            splashIllustration,
            width: 270.px3pt,
            height: 270.px3pt,
          ),
          SizedBox(
            height: 98.px3pt,
          ),
          Text(
            'Let\'s get started',
            style: TextStyle(
              color: const Color(0xFF15224F),
              fontWeight: FontWeight.w600,
              fontFamily: 'NunitoSansRegular',
              fontSize: 24.px3pt,
              decoration: TextDecoration.none,
              wordSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.px3pt,
          ),
          Text(
            'Lorem ipsum dolor amet, consectetur\n adipiscing elit, eiusmod tempor.',
            style: TextStyle(
              color: const Color(0xFF969AA8).withOpacity(0.8),
              decoration: TextDecoration.none,
              fontFamily: 'NunitoSansRegular',
              fontWeight: FontWeight.normal,
              fontSize: 16.px3pt,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 80.px3pt,
          ),
          RegisterOrLoginButton(text: 'Create Account', onPressed: onRegisterPressed),
          SizedBox(
            height: 20.px3pt,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have an account?',
                style: TextStyle(
                  color: const Color(0xFF969AA8),
                  fontWeight: FontWeight.normal,
                  fontSize: 16.px3pt,
                  fontFamily: 'NunitoSansRegular',
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: 4.px3pt,),
              GestureDetector(
                onTap: onLoginPressed,
                child: Text(
                  'Login.',
                  style: TextStyle(
                    color: const Color(0xFFFF9A40),
                    fontWeight: FontWeight.normal,
                    fontSize: 16.px3pt,
                    fontFamily: 'NunitoSansRegular',
                    decoration: TextDecoration.none,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }



  Future<bool> getUserInfoFromSharedPreferences(UserViewModel userViewModel, Function(String token) onLoginSuccess) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? "";
    final password = prefs.getString('password') ?? "";
    print("================================================");
    print("================================================");
    print(username);
    print(password);
    print("================================================");
    print("================================================");
    if (username.isEmpty || password.isEmpty) return false;
    var loginRes = userViewModel.login(username, password);
    loginRes.then((value) {
      if (userViewModel.viewState == ViewState.success) {
        // save token to secure storage
        onLoginSuccess(value);
      }
    });
    return true;
  }
}
