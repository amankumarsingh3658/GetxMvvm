import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Colors/appColors.dart';

class Utils {
  static void FieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String Message) {
    Fluttertoast.showToast(
      textColor: AppColors.white,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.blackColor,
        msg: Message);
  }

  static toastMessageCenter(String Message){
    Fluttertoast.showToast(
      textColor: AppColors.white,
      backgroundColor: AppColors.blackColor,
      gravity: ToastGravity.CENTER,
      msg: Message);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }
}
