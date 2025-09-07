import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationTimer extends StatelessWidget {
  final int remainingSeconds;
  final String Function(int) formatTime;
  final VoidCallback onResend;
  final String? userEmail;

  const VerificationTimer({
    super.key,
    required this.remainingSeconds,
    required this.formatTime,
    required this.onResend,
    this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = remainingSeconds > 0;

    return Column(
      children: [
        Text(
          formatTime(remainingSeconds),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "We sent Verification code to your email\n${userEmail ?? ''}, You can check your inbox",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 20),


        GestureDetector(
          onTap: isDisabled ? null : onResend,
          child: Text(
            isDisabled
                ? "You can resend after ${formatTime(remainingSeconds)}"
                : "Didn't receive the code? Send again",
            style: GoogleFonts.poppins(
              color: isDisabled ? Colors.grey : Colors.blue,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
