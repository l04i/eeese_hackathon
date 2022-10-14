import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  decoration: MyInputTheme.mytheme('Email'),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                  decoration: MyInputTheme.mytheme('Password'),
                ),
                SizedBox(
                  height: Dimensions.height120,
                ),
                AppButton(
                    onTap: () {}, color: Colors.deepOrangeAccent, text: 'Login')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
