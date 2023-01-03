import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

errorSnackBar({required title, required description}) {
  Get.snackbar(title, description,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

customSnackBar({required title, required description}) {
  Get.snackbar(title, description,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      //backgroundColor: Colors.accents,
      colorText: Color.fromARGB(255, 69, 37, 37));
}

toast(msg, Toast length_long, ToastGravity bottom) {
  Fluttertoast.showToast(
    msg: msg,
  );
}
