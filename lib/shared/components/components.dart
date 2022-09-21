import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/Login/LoginScreen.dart';
import 'package:shop_app/shared/network/Local/cache.dart';

void showToast({required String text, required ToastState state}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { success, error, warning }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case (ToastState.success):
      color = Colors.green;
      break;
    case (ToastState.error):
      color = Colors.red;
      break;
    case (ToastState.warning):
      color = Colors.amber;
      break;
  }
  return color;
}

void signOut({required BuildContext context}) {
  Cache_Helper.removeData(key: 'token').then((value) {
    if (value == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
  });
}
