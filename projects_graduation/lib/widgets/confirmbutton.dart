import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmButton extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final double height;
  final double width;
  final Function onPressed;
  const ConfirmButton(
      {Key? key,
      this.buttonColor = Colors.green,
      this.width = 360,
      required this.text,
      this.height = 55,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Color(0xFF44D7B6),
            borderRadius: BorderRadius.circular(20.r)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
