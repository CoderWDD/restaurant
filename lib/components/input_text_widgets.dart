
import 'package:flutter/material.dart';
import 'package:restaurant/utils/px2dp.dart';

typedef OnChangeCallback = void Function(String value);

class InputWidget extends StatefulWidget {
  final ValueChanged<String>? onValueSubmitted;
  final ValueChanged<String>? onValueChanged;
  final String? labelText;
  final bool? isPassword;
  const InputWidget({ super.key, this.labelText, this.isPassword, this.onValueChanged, this.onValueSubmitted});

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
      textInputAction: TextInputAction.next,
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