import 'package:flutter/material.dart';

abstract class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class LocaleInitial extends LocaleState {
   LocaleInitial() : super(Locale('en'));
}

class LocaleUpdated extends LocaleState {
  const LocaleUpdated(Locale locale) : super(locale);
}
