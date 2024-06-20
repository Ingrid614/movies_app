
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ludokin_agent/data/models/commande.dart';

abstract class CommandState {}

class InitialCommandState extends CommandState{}

class SendingCommand extends CommandState{}

class CommandSent extends CommandState{
  // final Command command;
  // CommandSent(this.command);
}

class SendingFailed extends CommandState{
  final String message ;
  SendingFailed(this.message);
}

class LoadingCommand extends CommandState{}

class LoadingCommandFailed extends CommandState {
  final String message;
  LoadingCommandFailed(this.message);
}
class LoadingCommandSuccess extends CommandState{
  // final Rx<List<Command>> commands;
  // LoadingCommandSuccess(this.commands);
}