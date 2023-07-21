import 'package:easy_localization/easy_localization.dart';
import 'package:ludokin_agent/data/providers/api_provider.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';

import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<LoginState>{
  AuthCubit():super(InitialLoginState());
  final ApiProvider _apiProvider = ApiProvider();

  Future <void> login(Object data) async{
    emit(LoggingIn());
    final ApiRepository apiRepository = ApiRepository(_apiProvider);
    print('logging in');
    try{
      print('trying log in');
      await Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.login(data);
      print(response);
      emit(LoggedIn(response));
    }catch (e){
      emit(LoginFailed('loginFailed'.tr()+apiRepository.responseBody.tr()));
    }
}

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    print(change);
  }

  // Future <void> register(User user) async{
  //   print('hello');
  //   emit(SigningUp());
  //   try{
  //     await Future.delayed(const Duration(seconds: 6),(){});
  //     var response = await _apiProvider.register(user);
  //     emit(SignUpSuccess(user));
  //   }catch (e){
  //     emit(SignUpFailed('sign up failed'));
  //   }
  // }
}