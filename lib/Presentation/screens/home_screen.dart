import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/colors.dart';
import '../../Cubit/metals/metals_cubit.dart';
import '../../Cubit/metals/metals_state.dart';
import '../widgets/home_page/Custom_Notification_Icon.dart';
import '../widgets/home_page/Custom_buttom_nav.dart';
import '../widgets/home_page/custom_Error_Card.dart';
import '../widgets/home_page/custom_Loading_Screen.dart';
import '../widgets/home_page/custom_metal_card.dart';
import 'Alerts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<MetalsCubit>().fetchMetals();
  }

  @override
  Widget build(BuildContext context) {

    if (selectedIndex != 0) {
      final List<Widget> otherScreens = [
        const Center(child: Text("Comparison")),
        const Center(child: Text("chat bot")),
        const AlertsScreen(),
      ];

      return Scaffold(
        backgroundColor: AppColors.screenBackground,
        body: otherScreens[selectedIndex - 1],
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onItemSelected: (index) => setState(() => selectedIndex = index),
        ),
      );
    }


    return BlocBuilder<MetalsCubit, MetalState>(
      builder: (context, state) {
        if (state is MetalLoading) {
          return LoadingScreen();
        } else if (state is MetalFailure) {
          return ErrorScreen();
        } else if (state is MetalSuccess) {
          final metals = state.metals;

          return Scaffold(
            backgroundColor: AppColors.screenBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.screenBackground,
                elevation: 0,
                titleSpacing: 0,
                flexibleSpace: SafeArea(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("Setting"),
                          icon: const Icon(
                            Icons.settings_rounded,
                            color: AppColors.primary,
                            size: 32,
                          ),
                        ),
                        Text(
                          "Home",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        const NotificationIcon(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:1.4,
              ),
              itemCount: metals.length,
              itemBuilder: (context, index) {
                final metal = metals[index];
                final imageUrl = "http://your-api.com${metal.image}";

                return MetalCard(
                  title: metal.name ?? "Unknown",
                  imagePath: imageUrl,
                  onTap: () {

                  },
                );
              },
            ),
            bottomNavigationBar: CustomBottomNavBar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) => setState(() => selectedIndex = index),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
