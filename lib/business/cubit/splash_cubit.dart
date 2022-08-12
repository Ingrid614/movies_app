import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  Future<void> isLoggedIn() async {
    // bool loggedIn = false;
    emit(!state);
  }
}
