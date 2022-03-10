import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  void showSnackBar(String title, String error) {
    Get.snackbar(
      title,
      error,
      backgroundColor: Colors.grey[900],
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static SnackBarUtil get to => Get.find<SnackBarUtil>();
}
