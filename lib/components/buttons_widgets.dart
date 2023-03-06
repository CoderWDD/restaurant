import 'package:flutter/material.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/utils/screen_util.dart';

class RegisterOrLoginButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;

  const RegisterOrLoginButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  State<RegisterOrLoginButton> createState() => _RegisterOrLoginButtonState();
}

class _RegisterOrLoginButtonState extends State<RegisterOrLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenMaxWidth(),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF9A3F),
              Color(0xFFFFAC61),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(50.px3pt)),
      child: FilledButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontFamily: 'NunitoSansRegular',
            fontSize: 16.px3pt,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
