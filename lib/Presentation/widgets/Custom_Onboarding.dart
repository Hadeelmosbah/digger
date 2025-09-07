import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';
import '../models/Onboarding_model .dart';


class CustomOnboardingBottom extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController controller;
  final OnboardingModel model;

  const CustomOnboardingBottom({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.controller,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 45,
          right: 30,
          left: 40,
          child: Image.asset(
            model.image,
            width: 750,
            height: 600,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Container(
              height: 380,
              width: double.infinity,
              color: AppColors.lightGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 71),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: model.title,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        model.description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: AppColors.subtitle,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: currentPage == totalPages - 1
                        ? Column(
                      children: [

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("Login");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 37,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              AppStrings.getStarted,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 55),


                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("Login");
                          },
                          child: Text.rich(
                            TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: AppColors.subtitle,
                              ),
                              children: [
                                TextSpan(
                                  text: " ${AppStrings.login}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (currentPage > 0)
                          InkWell(
                            onTap: () {
                              controller.previousPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const CircleAvatar(
                              radius: 33,
                              backgroundColor: AppColors.primary,
                              child: CircleAvatar(
                                backgroundColor: AppColors.lightGrey,
                                radius: 30,
                                child: Icon(
                                  size: 36,
                                  Icons.arrow_back_rounded,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          )
                        else
                          const SizedBox(width: 64),

                        SmoothPageIndicator(
                          controller: controller,
                          count: totalPages,
                          effect: JumpingDotEffect(
                            activeDotColor: AppColors.darkText,
                            dotHeight: 6,
                            dotWidth: 6,
                            jumpScale: .7,
                            verticalOffset: 15,
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.darkText,
                            radius: 33,
                            child: Icon(
                              size: 36,
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
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
        ),
      ],
    );
  }
}
