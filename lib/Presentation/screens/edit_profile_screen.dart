import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';
import '../../core/header_style.dart';
import '../widgets/custom_auth_screen/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: "Ahmed22");
    final emailController = TextEditingController(
      text: "ahmedmohammed123@gmail.com",
    );
    final passwordController = TextEditingController(text: "12345678");

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderStyle(title: AppStrings.editProfile, fontsize: 29),
              const SizedBox(height: 40),

              CustomTextField(
                controller: nameController,
                hint: AppStrings.username,
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: emailController,
                hint: AppStrings.email,
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: passwordController,
                hint: AppStrings.password,
                icon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: 220,
                child: Column(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                      ),
                      child: Text(
                        AppStrings.save,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.secondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 32),
                      ),
                      child: Text(
                        AppStrings.discard,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
