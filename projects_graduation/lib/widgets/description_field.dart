import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldDescription extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;
  final Color hintColor;
  final double hintSize;
  final TextInputType textInputType;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onValidator;
  final Color fieldColor;
  final Color textColor;

  const TextFieldDescription(
      {super.key,
      this.hintSize = 15,
      this.hintColor = Colors.grey,
      required this.hintText,
      required this.controller,
      required this.height,
      required this.textInputType,
      required this.horizontalPadding,
      required this.verticalPadding,
      required this.onChanged,
      required this.fieldColor,
      required this.onValidator,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      style: TextStyle(
        fontSize: 15,
        color: textColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fieldColor,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        suffixIconConstraints: BoxConstraints(minWidth: 0.w),
        prefixIconConstraints: BoxConstraints(minWidth: 9.w),
        isDense: true,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: height, horizontal: 15),
        hintStyle: TextStyle(
          fontSize: hintSize,
          color: hintColor,
          fontFamily: "Poppins-Regular",
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        errorStyle: const TextStyle(height: 0.5),
      ),
      validator: onValidator,
      onChanged: onChanged,
    );
  }
}