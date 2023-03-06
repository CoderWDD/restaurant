
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../constants/assets_constants.dart';

typedef OnChangeCallback = void Function(String value);

class InputWidget extends StatefulWidget {
  final ValueChanged<String>? onValueSubmitted;
  final ValueChanged<String>? onValueChanged;
  final String? labelText;
  final bool? isPassword;
  final TextInputAction textInputAction;
  const InputWidget({ super.key, this.labelText, this.isPassword, this.onValueChanged, this.onValueSubmitted, required this.textInputAction});

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ?? false,
      autofocus: true,
      maxLines: 1,
      textInputAction: widget.textInputAction,
      onChanged: widget.onValueChanged,
      onFieldSubmitted: widget.onValueSubmitted,
      decoration: InputDecoration(
        label: Text(widget.labelText ?? ''),
        labelStyle: TextStyle(
          fontSize: 16.px3pt,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF969AA8),
          decoration: TextDecoration.none,
          fontFamily: 'NunitoSansRegular',
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 24,
          color: Color(0xFF969AA8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEFEFEF),
          ),
          borderRadius: BorderRadius.circular(8.px3pt),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF969AA8),
          ),
          borderRadius: BorderRadius.circular(8.px3pt),
        ),
        contentPadding: EdgeInsets.only(
          left: 12.px3pt,
          right: 12.px3pt,
          top: 29.px3pt,
          bottom: 9.px3pt,
        ),
      ),
    );
  }
}


class SearchTrackingWidget extends StatefulWidget {
  final String? hintText;
  final OnChangeCallback onChangeCallback;
  final VoidCallback onSearchCallback;
  const SearchTrackingWidget({Key? key, required this.onSearchCallback, required this.onChangeCallback, required this.hintText}) : super(key: key);

  @override
  State<SearchTrackingWidget> createState() => _SearchTrackingWidgetState();
}

class _SearchTrackingWidgetState extends State<SearchTrackingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.px3pt,
      margin: EdgeInsets.only(top: 22.px3pt),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF23252F),
            ),
            borderRadius: BorderRadius.circular(18.px3pt),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE7E7E7),
            ),
            borderRadius: BorderRadius.circular(18.px3pt),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFFFF9A51).withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(18.px3pt),
          ),
          hintText: widget.hintText ?? 'Enter tracking number',
          hintStyle: TextStyle(
            color: const Color(0xFF23252F).withOpacity(0.5),
            fontSize: 13.px3pt,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              searchNormalIllustration,
              width: 20.px3pt,
              height: 20.px3pt,
              fit: BoxFit.scaleDown,
            ),
          ),
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              filterIllustration,
              width: 20.px3pt,
              height: 20.px3pt,
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {
              // Clear the text field
            },
          ),
        ),
        onChanged: widget.onChangeCallback,
        onSubmitted: widget.onChangeCallback,
      ),
    );
  }
}
