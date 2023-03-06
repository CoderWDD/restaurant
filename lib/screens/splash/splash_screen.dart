import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/components/buttons_widgets.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../constants/assets_constants.dart';

class SplashScreen extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;
  const SplashScreen({Key? key, required this.onLoginPressed, required this.onRegisterPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
