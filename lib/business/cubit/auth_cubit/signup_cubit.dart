import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/auth_cubit/signup_state.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';

import '../../../data/models/user.dart';
import '../../../data/providers/api_provider.dart';


class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit():super(InitialSignUpState());
  final ApiProvider _apiProvider = ApiProvider();



  Future <void> register(User user) async{
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    emit(SigningUp());
    try{
      print('trying signing up');
      await Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.registerUser(user);
      emit(SignUpSuccess(user));
    }catch (e){
      emit(SignUpFailed('signUpFailed'.tr()+apiRepository.responseBody));
    }
  }

  @override
  void onChange(Change<SignUpState> change) {
    super.onChange(change);
    print(change);
  }
}