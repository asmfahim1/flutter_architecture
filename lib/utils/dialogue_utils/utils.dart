import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/colors/app_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: AppColor.whiteColor,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message,
    );
  }

  static showLoading({String? title}) {
    String localizedTitle = title ?? 'loading'.tr;
    Get.dialog(
      Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const SpinKitWaveSpinner(
                  color: AppColor.primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  localizedTitle,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static closeLoading(){
    Get.back();
  }
}
