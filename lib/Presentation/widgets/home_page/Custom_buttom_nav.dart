import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      child: FlashyTabBar(
        backgroundColor: const Color(0xffE4E4E4),
        selectedIndex: selectedIndex,
        showElevation: false,
        onItemSelected: onItemSelected,
        items: [
          FlashyTabBarItem(
            icon: const Icon(Iconsax.home),
            title: Text(
              'Home',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xff303B54),
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.chart),
            title: Text(
              'Comparison',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xff303B54),
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.message),
            title: Text(
              'Chat',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xff303B54),
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.sound5),
            title: Text(
              'Alert',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xff303B54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
