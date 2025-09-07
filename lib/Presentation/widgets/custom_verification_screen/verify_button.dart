import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyButton extends StatelessWidget {
  final VoidCallback onVerify;

  const VerifyButton({super.key, required this.onVerify});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF6B238),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onVerify,
        child: Text(
          "Verify",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
