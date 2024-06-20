import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ludokin_agent/business/cubit/command_cubit/command_cubit.dart';
import 'package:ludokin_agent/business/cubit/command_cubit/command_state.dart';
import '../../data/models/commande.dart';
import '../widgets/command_field.dart';
import '../widgets/gap.dart';
import '../widgets/kin_snackbar.dart';
import 'package:ludokin_agent/data/models/client.dart';

class CommandScreen extends StatefulWidget{
  const CommandScreen({Key? key}) : super(key: key);

  @override
  State<CommandScreen> createState() => _CommandScreenState();
}

class _CommandScreenState extends State<CommandScreen> {

  Client client = Client(adresseKin: 'hxnynzx2r2tyu', numeroWhatsapp: '658596547', emailClient: 'stephanie2004@gmail.com', nomClient: 'stephanie', updatedAt: DateTime.now(), createdAt: DateTime.now(), id: 1);

  @override
  Widget build(BuildContext context) {
    Command command1 = Command(id: 1, createdAt: DateTime.now(), updatedAt: DateTime.now(), userId: 1, clientId: 1, adresseKin: 'chnqnquoqcncxnq', montant: 20000, taux: 6,cout: 1200,  client: client, statutId: 1);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("command_title").tr(),
      ),
      body: BlocConsumer<CommandCubit,CommandState>(
        listener: (BuildContext context, CommandState state){
          if(state is LoadingCommandFailed){
            showErrorSnack(context,state.message);
          }
        },
        builder: (BuildContext context, CommandState state) {
          switch (state.runtimeType){
            case LoadingCommand :
              return  const Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
            case LoadingCommandSuccess:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                // context.read<CommandCubit>().commands.value.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),

                    ],
                  );
                },
              );
            default:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                // context.read<CommandCubit>().commands.value.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                      const Gap(),
                      ShowCommand( command: command1,isSelling: true),
                    ],
                  );
                },
              );
          }

        }
      ),

    );
  }

  @override
  void initState() {
    context.read<CommandCubit>().getAllCommands();
  }
}

