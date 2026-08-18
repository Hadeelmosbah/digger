import 'package:digger/Cubit/users/user_cubit.dart';
import 'package:digger/Presentation/widgets/custom_auth_screen/Animated_container.dart';
import 'package:digger/Presentation/widgets/custom_auth_screen/custom_textfield.dart';
import 'package:digger/Presentation/widgets/custom_auth_screen/footer_auth.dart';
import 'package:digger/Presentation/widgets/custom_auth_screen/hearder_auth_screen.dart';
import 'package:digger/Presentation/widgets/custom_auth_screen/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import '../../Cubit/users/user_state.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';

import '../models/Validator.dart';
import '../widgets/custom_auth_screen/Toast_Helper.dart';
import '../widgets/custom_auth_screen/intro_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ToastHelper.showToast(
            context: context,
            message: AppStrings.signUpSuccess,
            type: ToastificationType.success,
          );
          Navigator.of(context).pushReplacementNamed("Home");
        } else if (state is SignUpFailure) {
          ToastHelper.showToast(
            context: context,
            message: state.errMessage,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<UserCubit>();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              const HeaderAuthScreen(
                title: AppStrings.loginHello,
                subtitle: AppStrings.loginWelcome,
              ),
              AuthAnimatedContainer(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.signUpFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IntroText(text: AppStrings.signUpTitle),
                        const SizedBox(height: 20),

                        CustomTextField(
                          controller: cubit.signUpName,
                          hint: AppStrings.username,
                          icon: Icons.person_2_outlined,
                          validator: Validators.validateUsername,
                        ),
                        const SizedBox(height: 15),

                        CustomTextField(
                          controller: cubit.signUpEmail,
                          hint: AppStrings.email,
                          icon: Icons.email_outlined,
                          validator: Validators.validateEmail,
                        ),
                        const SizedBox(height: 15),

                        CustomTextField(
                          controller: cubit.signUpPassword,
                          hint: AppStrings.password,
                          icon: Icons.lock_outline,
                          obscure: true,
                          validator: Validators.validatePassword,
                        ),
                        const SizedBox(height: 20),

                        state is SignUpLoading
                            ? const CircularProgressIndicator(
                          color: AppColors.secondary,
                        )
                            : CustomButton(
                          buttonText: AppStrings.signUpButton,
                          onPressed: () {
                            if (cubit.signUpFormKey.currentState!
                                .validate()) {
                              cubit.signUp();
                            }
                          },
                        ),

                        const SizedBox(height: 10),

                        AuthFooter(
                          onFacebookTap: (){},
                          onGoogleTap: (){},
                          bottomText: AppStrings.alreadyHaveAccount,
                          bottomActionText: AppStrings.login,
                          onBottomTap: () {
                            Navigator.of(context).pushNamed("Login");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
