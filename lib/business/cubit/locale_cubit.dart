import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(Locale initialState) : super(initialState);

  Future<void> changeLocale(String code, BuildContext context) async {
    Locale locale = Locale(code);
    await context.setLocale(locale);
    emit(context.locale);
  }
}
