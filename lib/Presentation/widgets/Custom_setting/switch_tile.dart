import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;

  const SwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,  required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      value: value,
      onChanged: onChanged,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      activeThumbColor :color,
    );
  }
}
