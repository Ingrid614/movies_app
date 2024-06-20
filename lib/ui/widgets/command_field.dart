import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/commande.dart';

class ShowCommand extends StatelessWidget {
  ShowCommand({Key? key, this.montantKin=0,  this.montantFcfa=0, required this.isSelling, required this.command}) : super(key: key);

  double montantKin;
  double montantFcfa;
  final Command command;
  final bool isSelling;

  DateTime now = DateTime.now();
  DateFormat formatDate = DateFormat('dd-MM-yyyy | hh.mm');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset('assets/images/todo-line.svg'),
      title: IntrinsicHeight(
        child: Row(
          children: [
            Text(command.client!.numeroWhatsapp!),
            const VerticalDivider(),
            Text(command.client!.nomClient!),

          ],
        ),
      ),
      subtitle: Text(
        formatDate.format(command!.createdAt!),
        style: const TextStyle(
            color: Color(0xff818181)
        ),
      ),
      onTap: (){
        isSelling? montantKin = command.montant!
            : montantFcfa = command.montant!;
        isSelling? montantFcfa = (command.montant!*8)/1000
            : montantKin = (command.montant!*1000)/8;
        showDialog(context: context, builder: (BuildContext context){
          return IntrinsicHeight(
              child: AlertDialog(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child:const Text("details",).tr(),
                        ),
                        IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close_sharp)
                        )
                      ]),
                  content: Flexible(
                    child: ListView(
                        shrinkWrap: true,
                        children: [
                          const Divider(height: 1, ),
                          Text("Nom du client : ${command.client!.nomClient}", ),
                          Text(isSelling?"Transaction : Vente de kin" : "Transaction : Achat de kin",),
                          isSelling? Text("Montants : $montantKin B KIN | $montantFcfa Fcfa",)
                              : Text("Montants : $montantFcfa Fcfa | $montantKin B KIN", ),
                          Text("Commission : ${montantFcfa*0.03} Fcfa", )
                        ]) ,
                  )
              )
          );
        });
      },

    );
  }

}