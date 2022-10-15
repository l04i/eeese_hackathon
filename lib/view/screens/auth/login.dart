import 'package:eeese_hackathon/controllers/auth_controller.dart';
import 'package:eeese_hackathon/routes/app_router.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.height120,
                ),
                TextField(
                  controller: _controller.emailController,
                  decoration: MyInputTheme.mytheme('Email'),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                  controller: _controller.passwordController,
                  decoration: MyInputTheme.mytheme('Password'),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?  '),
                    InkWell(
                      onTap: () => Get.toNamed(AppRouter.getSignup()),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height120,
                ),
                AppButton(
                    onTap: () async => await _controller.login(),
                    color: Colors.deepOrangeAccent,
                    text: 'Login')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
