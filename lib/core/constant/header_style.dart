import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class HeaderStyle extends StatelessWidget {
  final String title;
  final double fontsize;
  const HeaderStyle({super.key, required this.title, this.fontsize=36});


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 30,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
