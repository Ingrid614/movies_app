import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/gap.dart';

class CommandScreen extends StatelessWidget{
  const CommandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("command_title").tr(),
      ),
      body:

            ListView(
              scrollDirection: Axis.vertical,
              children: [
                ShowCommand(whatsAppNumber: "(+237)xxxxxx", name: "Moufe Ingrid", montantKin: 20000 , isSelling: true),
                Gap(),
                ShowCommand(whatsAppNumber: "(+237)xxxxxx", name: "Sylvannie FOKO", montantFcfa: 150, isSelling: false),
                Gap(),
                ShowCommand(whatsAppNumber: "(+237)xxxxxx", name: "Darline Ingrid", montantFcfa: 500 ,isSelling: false)
        ],
      ),

    );
  }

}

class ShowCommand extends StatelessWidget {
ShowCommand({Key? key, required this.whatsAppNumber, required this.name,  this.montantKin=0,  this.montantFcfa=0, required this.isSelling}) : super(key: key);

double montantKin;
double montantFcfa;
 final String whatsAppNumber;
 final String name;

 final bool isSelling;
 
 DateTime now = DateTime.now();
 DateFormat formatDate = DateFormat('dd-MM-yyyy | hh.mm');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset('assets/images/todo-line.svg', color: Colors.deepPurple),
      title: IntrinsicHeight(
        child: Row(
        children: [
          Text(whatsAppNumber,style: TextStyle(color: Colors.deepPurple),),
          VerticalDivider(),
          Text(name, style: TextStyle(color: Colors.deepPurple),),

        ],
      ),
    ),
      subtitle: Text(
        formatDate.format(now),
        style: TextStyle(
          color: Color(0xff818181)
        ),
      ),
      onTap: (){
        isSelling? montantFcfa = (montantKin*8)/1000
        : montantKin = (montantFcfa*1000)/8;
        showDialog(context: context, builder: (BuildContext context){
          return IntrinsicHeight(
              child: AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child:Text("details", style: TextStyle(color: Colors.deepPurple),).tr(),
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close_sharp)
                      )
                    ]),
                content: Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Divider(height: 1, color: Color(0xff818181),),
                      Text("Nom du client : ${name}", style: TextStyle(color: Colors.deepPurple),),
                      Text(isSelling?"Transaction : Vente de kin" : "Transaction : Achat de kin", style: TextStyle(color: Colors.deepPurple),),
                      isSelling? Text("Montant : ${montantKin} B KIN | ${montantFcfa} Fcfa", style: TextStyle(color: Colors.deepPurple),)
                      : Text("Montants : ${montantFcfa} Fcfa | ${montantKin} B KIN", style: TextStyle(color: Colors.deepPurple)),
                       Text("Commission : ${montantFcfa*0.03} Fcfa", style: TextStyle(color: Colors.deepPurple),)
            ]) ,
              )
          )
          );
        });
      },

    );
  }

}