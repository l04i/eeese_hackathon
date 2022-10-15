import 'package:eeese_hackathon/controllers/auth_controller.dart';
import 'package:eeese_hackathon/routes/app_router.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/view/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/style.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  AuthController _authController = Get.find<AuthController>();
  final List<String> deps = [
    'Electrical',
    'Mechanical',
    'Civil',
    'Chemical',
    'Survey',
    'Agricultral',
    'Petroleum',
    'Mining'
  ];
  List<String> years = ['First', 'Second', 'Third', 'Fourth', 'Fifth'];
  String selectedDep = 'Electrical';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.height15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: _authController.nameController,
                decoration: MyInputTheme.mytheme('Name'),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _authController.emailController,
                decoration: MyInputTheme.mytheme('Email'),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _authController.uniNumController,
                decoration: MyInputTheme.mytheme('University number'),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              DropdownButtonFormField(
                decoration: MyInputTheme.mytheme('Department'),
                items: deps
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: ((value) {
                  _authController.department = value as String;
                }),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              DropdownButtonFormField(
                decoration: MyInputTheme.mytheme('Year'),
                items: years
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: ((value) {
                  _authController.year = value as String;
                }),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _authController.passwordController,
                decoration: MyInputTheme.mytheme('Password'),
              ),
              SizedBox(
                height: Dimensions.height45,
              ),
              AppButton(
                  onTap: () => _authController.validateUserInfo(),
                  color: Colors.deepOrangeAccent,
                  text: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
