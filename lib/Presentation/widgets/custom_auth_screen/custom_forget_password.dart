import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("Verification");
        },
        child: Text(
          AppStrings.loginForgotPassword,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: AppColors.subtitle,
          ),
        ),
      ),
    );
  }
}
