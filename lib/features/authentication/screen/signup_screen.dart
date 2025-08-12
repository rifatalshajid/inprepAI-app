import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inprep_ai/core/common/styles/global_text_style.dart';
import 'package:inprep_ai/routes/app_routes.dart';
import '../../../core/common/widgets/auhe_custom_textfiled.dart'
    show AuthCustomTextField;
import '../../../core/common/widgets/custom_button.dart';
import '../controller/signup_screen_controller.dart' show SpSignupController;

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  SpSignupController singupController = Get.put(SpSignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Text(
          'Sign Up',
          style: getTextStyle(
            color: Color(0xFF333333),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Name',
                style: getTextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              AuthCustomTextField(
                text: 'Enter your Name',
                onChanged: (value) {
                  singupController.validateFrom();
                },
                controller: singupController.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Phone Number',
                style: getTextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              AuthCustomTextField(
                controller: singupController.phoneController1,
                text: 'Enter your Phone Number',
                onChanged: (value) {
                  singupController.validateFrom();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Phone Number e.g:+8801234567891';
                  }
                  RegExp phoneRegex = RegExp(r'^\+8801[3-9][0-9]{8}$');
                  if (!phoneRegex.hasMatch(value)) {
                    return 'Invalid phone number format. Use +8801XXXXXXXXX';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Email',
                style: getTextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              AuthCustomTextField(
                controller: singupController.emailController1,
                text: 'Enter your Email',
                onChanged: (value) {
                  singupController.validateFrom();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid email address';
                  }

                  RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Invalid email format. Example: example@mail.com';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Password',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => AuthCustomTextField(
                  text: 'Enter your Password',
                  onChanged: (value) {
                    singupController.validateFrom();
                  },
                  controller: singupController.passwordController,
                  obscureText: singupController.isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      singupController.isPasswordVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color(0xFF37B874),
                    ),
                    onPressed: singupController.togglePasswordVisibility,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Retype Password',
                style: getTextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => AuthCustomTextField(
                  controller: singupController.retypepasswordController,
                  text: 'Enter your Password',
                  onChanged: (value) {
                    singupController.validateFrom();
                  },
                  obscureText: singupController.isPasswordVisible1.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      singupController.isPasswordVisible1.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color(0xFF37B874),
                    ),
                    onPressed: singupController.togglePasswordVisibility1,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != singupController.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 32),
              Obx(
                () => CustomButton(
                  title: 'Sign Up',
                  textcolor:
                      singupController.isFromValid.value
                          ? Colors.white
                          : Color(0xFF37B874),
                  onPress:
                      singupController.isFromValid.value
                          ? () {
                            Get.toNamed(AppRoute.otpSentScreen);
                          }
                          : null,
                  backgroundColor:
                      singupController.isFromValid.value
                          ? Color(0xFF37B874)
                          // ignore: deprecated_member_use
                          : Color(0xFFEBF8F1),
                  borderColor:
                      singupController.isFromValid.value
                          ? Color(0xFF37B874)
                          // ignore: deprecated_member_use
                          : Color(0xFFEBF8F1),
                ),
              ),
              SizedBox(height: 28),
              SizedBox(height: 32),
              if (Platform.isAndroid || Platform.isIOS) ...[],
              SizedBox(height: 16),
              if (Platform.isIOS) ...[],
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: getTextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.loginScreen);
                    },
                    child: Text(
                      "Sign In",
                      style: getTextStyle(
                        color: Color(0xFF37B874),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
