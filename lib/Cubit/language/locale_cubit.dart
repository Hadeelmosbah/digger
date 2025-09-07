import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  void toEnglish() => emit(const LocaleUpdated(Locale('en')));
  void toArabic() => emit(const LocaleUpdated(Locale('ar')));
}
