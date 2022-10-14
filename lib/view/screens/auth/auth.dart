import 'package:eeese_hackathon/routes/app_router.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/view/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.height20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
                onTap: () => Get.toNamed(AppRouter.getLogin()),
                color: Colors.deepOrangeAccent,
                text: 'Login'),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppButton(
                onTap: () => Get.toNamed(AppRouter.getSignup()),
                color: Colors.grey,
                text: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
