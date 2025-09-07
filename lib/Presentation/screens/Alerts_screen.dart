import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';
import '../widgets/alert_screen/Custom_list_tile.dart';
import '../widgets/alert_screen/custom_noalert.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  bool hasAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.screenBackground,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            size: 25,
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.alertsTitle,
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() => hasAlerts = false);
            },
            icon: const Icon(
              Icons.mark_email_read_outlined,
              color: AppColors.secondary,
            ),
            label: Text(
              AppStrings.markAsRead,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
      body: hasAlerts
          ? ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AlertCard(
            icon: Image(
              image: AssetImage('assets/Alert/gold.png'),
              width: 30,
            ),
            title: AppStrings.goldTitle,
            subtitle: AppStrings.goldSubtitle,
          ),
          SizedBox(height: 12),
          AlertCard(
            icon: Image(
              image: AssetImage('assets/Alert/sliver.png'),
              width: 30,
            ),
            title: AppStrings.silverTitle,
            subtitle: AppStrings.silverSubtitle,
          ),
          SizedBox(height: 12),
          AlertCard(
            icon: Image(
              image: AssetImage('assets/Alert/zinc.png'),
              width: 30,
            ),
            title: AppStrings.zincTitle,
            subtitle: AppStrings.zincSubtitle,
          ),
          SizedBox(height: 12),
          AlertCard(
            icon: Image(
              image: AssetImage('assets/Alert/platinum.png'),
              width: 30,
            ),
            title: AppStrings.platinumTitle,
            subtitle: AppStrings.platinumSubtitle,
          ),
        ],
      )
          : const NoAlertsWidget(),
    );
  }
}
