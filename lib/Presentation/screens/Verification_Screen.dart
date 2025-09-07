import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/colors.dart';
import '../widgets/custom_auth_screen/Toast_Helper.dart';
import '../widgets/custom_verification_screen/custom_verification_timer.dart';
import '../widgets/custom_verification_screen/pin_input_field.dart';
import '../widgets/custom_verification_screen/verify_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? userEmail;
  int remainingSeconds = 300;
  Timer? countdownTimer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userEmail = ModalRoute.of(context)?.settings.arguments as String?;
    startTimer();
  }

  void startTimer() {
    countdownTimer?.cancel();
    setState(() {
      remainingSeconds = 300;
    });
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$sec";
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Verification",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Text(
                "Enter Your\nVerification Code",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff303B54),
                ),
              ),
              const SizedBox(height: 30),

              PinInputField(),

              const SizedBox(height: 10),

              VerificationTimer(
                remainingSeconds: remainingSeconds,
                formatTime: formatTime,
                onResend: () {
                  startTimer();
                  ToastHelper.showToast(
                    context: context,
                    message: "Code sent again!",
                  );
                },
                userEmail: userEmail,
              ),

              const Spacer(),

              VerifyButton(
                onVerify: () {
                  ToastHelper.showToast(
                    context: context,
                    message: "Verifying...",
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
