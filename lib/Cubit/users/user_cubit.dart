import 'package:digger/Cubit/users/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/api/api_consumer.dart';
import '../../core/api/end_points.dart';
import '../../core/api/errors/exceptions.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;

  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

  Future<void> signIn() async {
    try {
      emit(SignInLoading());

      Response response = await api.post(
        EndPoint.signIn,
        isFromData: true,
        data: {
          ApiKey.Email: signInEmail.text,
          ApiKey.Password: signInPassword.text,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data;

        if (token != null && token is String) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", token);
        }

        emit(SignInSuccess());
      } else {
        emit(SignInFailure(
            errMessage: "Unexpected status: ${response.statusCode}"));
      }
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.description));
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
    }
  }

  Future<void> signUp() async {
    try {
      emit(SignUpLoading());

      Response response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.Email: signUpEmail.text,
          ApiKey.Password: signUpPassword.text,
          ApiKey.Username: signUpName.text,
        },
      );

      if (response.statusCode == 200) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailure(
            errMessage: "Unexpected status: ${response.statusCode}"));
      }
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.description ?? "Server error"));
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(LogoutLoading());

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("token");


      final check = prefs.getString("token");
      debugPrint("Token after logout: $check");

      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(errMessage: e.toString()));
    }
  }
}
