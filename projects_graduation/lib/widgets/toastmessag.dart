import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required message,
  required BuildContext context,
}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Theme.of(context).colorScheme.background,
    textColor: Theme.of(context).colorScheme.secondary,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    webPosition: 'center',
    timeInSecForIosWeb: 3,
  );
}
