import 'package:aklk_3ndna/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 14),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return '$hintText is empty !!!';
          }
          return null;
        },
        controller: controller,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.text,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          border: _getBorderStyle(),
          focusedBorder: _getBorderStyle(),
          enabledBorder: _getBorderStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

OutlineInputBorder _getBorderStyle({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? kPrimaryColor,
    ),
  );
}
