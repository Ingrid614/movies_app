import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibleCubit extends Cubit<bool>{
  PasswordVisibleCubit():super(true);
  bool passwordVisible=true;

  void togglePasswordVisible(){
    passwordVisible=!passwordVisible;
    emit(passwordVisible);
  }

}