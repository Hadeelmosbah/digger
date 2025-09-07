import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../custom_auth_screen/Toast_Helper.dart';

class PinInputField extends StatelessWidget {
  const PinInputField({super.key});

  @override
  Widget build(BuildContext context) {
    const goldColor = Color(0xffF6B238);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: goldColor, width: 2), 
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: goldColor, width: 3),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: Colors.white,
          border: Border.all(color: goldColor, width: 2),
        ),
      ),
      onCompleted: (pin) {
        ToastHelper.showToast(
          context: context,
          message: "Entered Code: $pin",
        );
      },
    );
  }
}
