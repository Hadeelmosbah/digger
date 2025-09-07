import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';
import '../../core/header_style.dart';
import '../widgets/Custom_setting/costom_logout_button.dart';
import '../widgets/Custom_setting/language_title.dart';
import '../widgets/Custom_setting/section_header.dart';
import '../widgets/Custom_setting/setting_tile.dart';
import '../widgets/Custom_setting/switch_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderStyle(title: AppStrings.settings,fontsize:35),
            Expanded(
              child: ListView(
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
                children: [
                  const SectionHeader(
                    icon: Icons.person_2_rounded,
                    title: AppStrings.account,
                    color: AppColors.primary,
                  ),
                  SettingsTile(
                    title: AppStrings.editProfile,
                    color: AppColors.primary,
                    onTap: () => Navigator.pushReplacementNamed(
                        context, "EditProfile"),
                  ),
                  SettingsTile(
                    title: AppStrings.changePassword,
                    color: AppColors.primary,
                    onTap: () => Navigator.pushReplacementNamed(
                        context, "ChangePassword"),
                  ),
                  const SectionHeader(
                    icon: Icons.notifications_rounded,
                    title: AppStrings.notification,
                    color: AppColors.primary,
                  ),
                  SwitchTile(
                    title: AppStrings.notifications,
                    value: true,
                    color: AppColors.primary,
                    onChanged: (val) {},
                  ),
                  SwitchTile(
                    title: AppStrings.appAlerts,
                    value: false,
                    color: AppColors.primary,
                    onChanged: (val) {},
                  ),
                  const SectionHeader(
                    icon: Icons.add_rounded,
                    title: AppStrings.more,
                    color: AppColors.primary,
                  ),
                  LanguageTile(),
                  SwitchTile(
                    title: AppStrings.darkMode,
                    value: false,
                    color: AppColors.primary,
                    onChanged: (val) {},
                  ),
                  const SectionHeader(
                    icon: Icons.phone,
                    title: AppStrings.contact,
                    color: AppColors.primary,
                  ),
                  SettingsTile(
                    title: AppStrings.facebook,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: AppStrings.email,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  const CustomLogoutButton(),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      AppStrings.copyRight,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
