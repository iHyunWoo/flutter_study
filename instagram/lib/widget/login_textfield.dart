import 'package:flutter/material.dart';
import 'package:instagram/util/constants.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  final IconButton? suffixIcon;
  final bool showClearButton;
  final bool isSecureText;
  final ValueChanged<String>? onChanged;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.placeHolder,
    this.suffixIcon,
    this.showClearButton = false,
    this.isSecureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: isSecureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color(0xFFF9F9F9),
          labelText: placeHolder,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Constants.lightGreyTextColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Constants.borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Constants.borderColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}
