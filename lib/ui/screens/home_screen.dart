import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/command_cubit/command_cubit.dart';
import 'package:ludokin_agent/business/cubit/command_cubit/command_state.dart';
import 'package:ludokin_agent/data/models/client.dart';
import 'package:ludokin_agent/data/models/commande.dart';
import 'package:ludokin_agent/data/providers/api_provider.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';
import 'package:ludokin_agent/ui/widgets/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes/routes.dart';
import '../widgets/command_field.dart';
import '../widgets/kin_snackbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiProvider _apiProvider = ApiProvider();

  Client client = Client(adresseKin: 'hxnynzx2r2tyu', numeroWhatsapp: '658596547', emailClient: 'stephanie2004@gmail.com', nomClient: 'stephanie', updatedAt: DateTime.now(), createdAt: DateTime.now(), id: 1);
  @override
  Widget build(BuildContext context) {
    Command command1 = Command(id: 1, createdAt: DateTime.now(), updatedAt: DateTime.now(), userId: 1, clientId: 1, adresseKin: 'chnqnquoqcncxnq', montant: 20000, taux: 6,cout: 1200,  client: client, statutId: 1);
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("transaction").tr(),
      ),

      body: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
                  child:SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                    children: [
                      const Gap(size: 5),
                      Container(
                        height: w*0.35,
                        child: Column(
                            children:[
                        Container(
                            height: 140,
                            width: 289,
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                  children: [
                                  const Text(
                                    "balance",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ).tr(),
                                const Gap(size: 45),
                                const Text(
                                  "0.00 Fcfa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                )
                              ]
                          ),

                        )
                    ),
                    Row(
                      children: [
                        Expanded(child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.buykin);
                            },
                            child: Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                      "buy",
                                    ).tr(),
                                      SvgPicture.asset(
                                        'assets/images/inbox-archive-fill.svg',
                                        color: Colors.white,)
                                    ])
                            )
                        )
                        ),
                        const Gap(size: 73),
                        Expanded(child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.sellkin);
                            },
                            child: Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [const Text(
                                      "sell",
                                  ).tr(),
                                      SvgPicture.asset(
                                        'assets/images/inbox-unarchive-fill.svg',
                                        color: Colors.white,)
                                    ])
                            )
                        )
                        )
                      ],
                    ),
          ])
                    ),
                    const Gap(size: 20),
                    Container(
                      alignment: Alignment.bottomLeft,
                        child: const Text("recent_transaction",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              // color: Colors.deepPurple,
                              decoration: TextDecoration.underline,
                            ),
                          textAlign: TextAlign.left,
                        ).tr(),
                    ),
                      BlocConsumer<CommandCubit, CommandState>(
                        listener: (BuildContext context,CommandState state){
                          if(state is LoadingCommandFailed){
                          showErrorSnack(context,state.message);
                          }
                      },
                        builder: (BuildContext context, CommandState state) {
                          switch(state.runtimeType){
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
                                      ShowCommand( command: command1,isSelling: false),
                                      const Gap(),
                                      ShowCommand( command: command1,isSelling: true),
                                      const Gap(),
                                      ShowCommand( command: command1,isSelling: false),
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
                                      const Gap(),
                                      ShowCommand( command: command1,isSelling: true),
                                      const Gap(),
                                      ShowCommand( command: command1,isSelling: false),
                                      const Gap(),
                                      ShowCommand( command: command1,isSelling: true),
                                      const Gap(),
                                      ShowCommand( command: command1,isSelling: false),
                                    ],
                                  );
                                },
                              );
                          }
                        }
                      )
                        ],),
                  )
          )
      )
    );
    
  }
  @override
  void initState() {
    context.read<CommandCubit>().getAllCommands();
  }
}
