import 'package:digger/Presentation/screens/Sign_up_screen.dart';
import 'package:digger/Presentation/screens/home_screen.dart';
import 'package:digger/Presentation/screens/splash_screen.dart';
import 'package:digger/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/metals/metals_cubit.dart';
import 'Cubit/users/user_cubit.dart';
import 'Presentation/screens/Onboarding_screen.dart';
import 'Presentation/screens/edit_profile_screen.dart';
import 'Presentation/screens/Verification_Screen.dart';
import 'Presentation/screens/login_screen.dart';
import 'Presentation/screens/setting_screen.dart';
import 'Presentation/widgets/home_page/custom_Loading_Screen.dart';
import 'generated/l10n.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(DioConsumer(dio: Dio()))),
        BlocProvider(create: (context) => MetalsCubit(DioConsumer(dio: Dio()))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'),Locale('ar')],
      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
      routes: {
        "Verification": (context) => const VerificationScreen(),
        "Loading": (context) => const LoadingScreen(),
        "EditProfile": (context) => const EditProfileScreen(),
        "Home": (context) => const HomeScreen(),
        "Onboarding": (context) => const OnboardingScreen(),
        "Login": (context) => const LoginScreen(),
        "SignUP": (context) => const SignUpScreen(),
        "Setting": (context) => const SettingsScreen(),
      },
    );
  }
}
