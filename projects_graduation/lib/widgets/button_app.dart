import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonApp extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final double height;
  final double width;
  final Function onPressed;
  const ButtonApp(
      {Key? key,
      this.buttonColor = Colors.green,
      this.width = 200,
      required this.text,
      this.height = 60,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
