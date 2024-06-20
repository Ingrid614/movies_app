import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../routes/routes.dart';
import '../widgets/gap.dart';


class ChatScreen extends StatelessWidget{
   ChatScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chat_title").tr()
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ShowContact(name: "Agent 1", number: "(+237)xxxxxx"),
                const Gap(size: 30,),
                ShowContact(name: "Agent 2", number: "(+237)xxxxxx"),
                const Gap(size: 30,),
                ShowContact(name: "Agent 3", number: "(+237)xxxxxx")

                ],
            )
        ),
      ),
    );
  }



}
class ShowContact extends StatelessWidget{
   ShowContact({Key? key, required this.name, required this.number}) : super(key: key);
 final String name;
 final String number;
 
 DateFormat format= DateFormat('hh.mm');
 DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
   return ListTile(
     onTap: (){
       Navigator.pushNamed(context,Routes.inbox);
     },
     leading: const Icon(Icons.account_circle,
       size: 50,),
     title: Text(
       name,
     ),
     subtitle: Text(
       number,
       style: const TextStyle(
         color: Color(0xff818181),
       ),
     ),
     trailing: Text(
         format.format(now).toString(),
          style:  const TextStyle(
            color:Color(0xff818181)
          ),),
   );
  }


}
