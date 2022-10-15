import 'dart:async';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  void _loadResources() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("showHome");
    // AuthController authController = Get.find();
    // String initialRoute = await authController.setInitialScreen();
    // Timer(const Duration(seconds: 3), () => Get.toNamed(initialRoute));
    Timer(const Duration(seconds: 3), () {});
  }

  @override
  void initState() {
    _loadResources();
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: _animation,
              child: Center(
                  child: Image.asset(
                "assets/images/logo.png",
                width: Dimensions.splashImg * 1.4,
              ))),
        ],
      ),
    );
  }
}
