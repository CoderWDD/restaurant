import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/auth_view_model.dart';
import 'package:restaurant/viewmodel/user_view_model.dart';

import '../../base/view_state.dart';
import '../../components/buttons_widgets.dart';
import '../../components/input_text_widgets.dart';
import '../../constants/assets_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScaffold();
  }
}

class LoginScaffold extends StatefulWidget {
  const LoginScaffold({Key? key}) : super(key: key);

  @override
  State<LoginScaffold> createState() => _LoginScaffoldState();
}

class _LoginScaffoldState extends State<LoginScaffold> {
  var _username = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFFFFCFA),
            child: Column(
              children: [
                SizedBox(
                  height: 65.px3pt,
                ),
                SvgPicture.asset(
                  loginIllustration,
                  width: 180.px3pt,
                  height: 180.px3pt,
                ),
                SizedBox(
                  height: 40.px3pt,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 24.px3pt,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15224F),
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 10.px3pt,
                ),
                Text(
                  'Lorem ipsum dolor amet, consectetur\n adipiscing elit, eiusmod tempor.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.px3pt,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF969AA8),
                      decoration: TextDecoration.none,
                      height: 2.0,
                      wordSpacing: 2,
                      fontFamily: 'NunitoSansRegular'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30.px3pt,
                    left: 24.px3pt,
                    right: 24.px3pt,
                  ),
                  padding: EdgeInsets.only(
                    left: 16.px3pt,
                    right: 16.px3pt,
                    top: 20.px3pt,
                    bottom: 20.px3pt,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFE),
                    borderRadius: BorderRadius.circular(30.px3pt),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFEFEFEF),
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16.px3pt),
                      child: InputWidget(
                        labelText: 'Name',
                        onValueChanged: (value) {
                          _username = value;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16.px3pt),
                      child: InputWidget(
                        labelText: 'Password',
                        isPassword: true,
                        onValueChanged: (value) {
                          _password = value;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    RegisterOrLoginButton(
                      text: 'Login',
                      onPressed: () {
                        // call login function
                        var userViewModel = Provider.of<UserViewModel>(context, listen: false);
                        var loginRes = userViewModel.login(_username, _password);
                        loginRes.then((value) {
                          if (userViewModel.viewState == ViewState.success) {
                            // save token to secure storage
                            var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
                            authViewModel.saveToken(value);
                          }
                        });
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
