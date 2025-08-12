import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/forget_password_controller.dart'
    show ForgetPasswordController;

// ignore: must_be_immutable
class CustomPinField extends StatelessWidget {
  final TextEditingController controller;
  final ForgetPasswordController vForgetPasswordController = Get.put(
    ForgetPasswordController(),
  );

  CustomPinField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 6,
      onChanged: (value) {
        controller.text = value;
        vForgetPasswordController.validdateForm2();
      },
      pinTheme: PinTheme(
        fieldHeight: 50,
        fieldWidth: 50,
        selectedBorderWidth: 1,
        selectedColor: Color(0xFFE5E6EB),
        activeColor: Color(0xFFA7A7A7),
        inactiveColor: Color(0xFFEBFAEB),
        activeBorderWidth: 1,
        inactiveBorderWidth: 1,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
