import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';

class AuthFooter extends StatelessWidget {
  final String bottomText;
  final String bottomActionText;
  final VoidCallback onBottomTap;

  const AuthFooter({
    super.key,
    required this.bottomText,
    required this.bottomActionText,
    required this.onBottomTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 13),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("Home");
          },
          child: Text(
            AppStrings.loginJustTakeALook,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 60,
              child: Divider(color: AppColors.border, thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                AppStrings.loginOrContinue,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.subtitle,
                ),
              ),
            ),
            const SizedBox(
              width: 60,
              child: Divider(color: AppColors.border, thickness: 1),
            ),
          ],
        ),

        const SizedBox(height: 0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/Social/facebook.png",
                height: 55,
                width: 55,
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              "assets/Social/google.png",
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ],
        ),

        const SizedBox(height: 3),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bottomText,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.subtitle,
              ),
            ),
            TextButton(
              onPressed: onBottomTap,
              child: Text(
                bottomActionText,
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
