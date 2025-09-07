import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';


class OnboardingModel {
  final List<TextSpan> title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "assets/Onboarding/onboard1.png",
    description: AppStrings.onboarding1Description,
    title: [
      TextSpan(
        text: AppStrings.onboarding1Title1,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding1Title2,
        style: GoogleFonts.poppins(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: AppColors.highlight,
        ),
      ),
    ],
  ),
  OnboardingModel(
    image: "assets/Onboarding/onboard2.png",
    description: AppStrings.onboarding2Description,
    title: [
      TextSpan(
        text: AppStrings.onboarding2Title1,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding2Title2,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.highlight,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding2Title3,
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
      ),
    ],
  ),
  OnboardingModel(
    image: "assets/Onboarding/onboard3.png",
    description: AppStrings.onboarding3Description,
    title: [
      TextSpan(
        text: AppStrings.onboarding3Title1,
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding3Title2,
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.highlight,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding3Title3,
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding3Title4,
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.highlight,
        ),
      ),
      TextSpan(
        text: AppStrings.onboarding3Title5,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
      ),
    ],
  ),
];
