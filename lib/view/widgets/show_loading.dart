import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  Get.defaultDialog(
      title: '',
      radius: Dimensions.radius15,
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: 300,
        width: double.maxFinite - Dimensions.width20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrangeAccent,
          ),
        ),
      ));
}

void showSnackBar({required String title, required String message}) {
  Get.snackbar(title, message,
      backgroundColor: Colors.deepOrangeAccent,
      margin: EdgeInsets.all(Dimensions.width10),
      borderRadius: Dimensions.radius15,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      icon: Icon(
        Icons.warning_sharp,
        color: Colors.white,
        size: Dimensions.isconSize24,
      ));
}
