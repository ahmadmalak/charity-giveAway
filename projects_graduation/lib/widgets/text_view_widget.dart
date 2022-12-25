import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget regularTextLight({
  Color textColor = Colors.white,
  double sizeText = 14,
  required String text,
  required BuildContext context,
}) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: sizeText,
      fontWeight: FontWeight.w400,
    ),
    textAlign: TextAlign.center,
  );
}
