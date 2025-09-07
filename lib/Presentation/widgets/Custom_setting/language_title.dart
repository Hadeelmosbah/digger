import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Cubit/language/locale_cubit.dart';
import '../../../core/constant/colors.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.language, color: AppColors.primary),
      title: const Text(
        "Languages",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
      ),
      children: [
        ListTile(
          title: const Text("English"),
          onTap: () {
            context.read<LocaleCubit>().toEnglish();
          },
        ),
        ListTile(
          title: const Text("العربية"),
          onTap: () {
            context.read<LocaleCubit>().toArabic();
          },
        ),
      ],
    );
  }
}
