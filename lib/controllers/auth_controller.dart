import 'dart:io';

import 'package:eeese_hackathon/data/models/user.dart';
import 'package:eeese_hackathon/helper/dependencies.dart';
import 'package:eeese_hackathon/utils/constants.dart';
import 'package:eeese_hackathon/view/widgets/show_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_router.dart';

class AuthScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

class AuthController extends GetxController {
  String? department;
  String? year;
  String? profile;
  String? profilePic;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController uniNumController = TextEditingController();

  void validateUserInfo() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        uniNumController.text.isEmpty ||
        passwordController.text.isEmpty ||
        year == null ||
        department == null) {
      showSnackBar(title: 'Error', message: 'All fields are required');
    } else {
      Get.toNamed(AppRouter.getProfilePic());
    }
  }

  Future<String> setInitialScreen() async {
    bool isLoggedIn = auth.currentUser != null;
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (isLoggedIn) {
      return '/home';
    } else if (pref.getBool("showHome") == true) {
      return '/login';
    } else {
      return '/onboarding';
    }
  }

  Future<Map<String, String>> getUserInfo() async {
    return await authRepository.getUserInfo();
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<void> uploadProfilePic({required File file}) async {
    profilePic = await storageRepository.uploadImageToStorage(
        childName: 'Profile_pictures', file: file, isEvent: false);
  }

  Future<void> signUp() async {
    User user = User(
        id: 'null',
        username: nameController.text,
        email: emailController.text,
        department: department as String,
        year: year as String,
        profilePic: profilePic ??
            'https://www.maxpixel.net/static/photo/1x/Insta-Instagram-Instagram-Icon-User-3814081.png',
        isAdmin: false,
        uniNumber: uniNumController.text);
    await authRepository.signUp(user, passwordController.text);
  }

  Future<void> login() async => await authRepository.signIn(
      email: emailController.text, password: passwordController.text);
}
