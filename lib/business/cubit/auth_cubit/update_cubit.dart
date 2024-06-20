import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/auth_cubit/update_state.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';

import '../../../data/providers/api_provider.dart';


class UpdateCubit extends Cubit<UpdateState>{
  UpdateCubit():super(InitialUpdateState());
  final ApiProvider _apiProvider = ApiProvider();



  Future <void> updateUser(Object data) async{
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    emit(Updating());
    try{
      print('trying updating up');
      await Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.updateUser(data);
      print(response);
      emit(Updated(response));
    }catch (e){
      emit(UpdateFailed('updateFailed'.tr()+apiRepository.responseBody));
      print(e.toString());
    }
}

  @override
  void onChange(Change<UpdateState> change) {
    super.onChange(change);
    print(change);
  }
}