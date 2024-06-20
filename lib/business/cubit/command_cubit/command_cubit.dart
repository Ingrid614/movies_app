import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/data/providers/api_provider.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';
import '../../../data/models/commande.dart';
import 'command_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CommandCubit extends Cubit<CommandState>{
  CommandCubit():super(InitialCommandState());
  final ApiProvider _apiProvider = ApiProvider();
  Rx<List<Command>> commands = Rx<List<Command>>([]);

  Future <void> newCommand (Object data) async{
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    emit(SendingCommand());
    print('sending command');
    try{
      print('trying to send command');
      Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.createCommand(data);
      emit(CommandSent());
      print(response.toString());
    }catch(e){
      emit(SendingFailed('sendingFailed'.tr()+apiRepository.responseBody));
      print(e.toString());
    }
  }

  Future <void> getAllCommands() async {
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    emit(LoadingCommand());
    print('loading commands');
    try{
      Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.getAllCommands();
      commands = response;
      emit(LoadingCommandSuccess());
      print(response);
    }catch(e){
      print(e.toString());
      emit(LoadingCommandSuccess());
      // emit(LoadingCommandFailed('loadingCommandFailed'.tr()));
    }
  }
  Future <void> getRecentsCommands() async {
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    emit(LoadingCommand());
    print('loading commands');
    try{
      Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.getRecentsCommands();
      commands = response;
      emit(LoadingCommandSuccess());
      print(response);
    }catch(e){
      print(e.toString());
      emit(LoadingCommandFailed('loadingCommandFailed'.tr()));
    }
  }

  @override
  void onChange(Change<CommandState> change) {
    super.onChange(change);
    print(change);
  }
}