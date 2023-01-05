import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projects_graduation/constant/constants.dart';

void showToast({
  required message,
  required BuildContext context,
}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: kPrimaryColor,
    textColor: Colors.white,
    fontSize: 16,
    gravity: ToastGravity.CENTER_LEFT,
  );
}
