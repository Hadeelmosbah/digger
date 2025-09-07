import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'custom_dialog.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF465066);

    return OutlinedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const CustomDialog(),
        );
      },
      icon: const Icon(
        Iconsax.logout,
        color: mainColor,
      ),
      label: Text(
        "Log out",
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: mainColor,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: mainColor),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
