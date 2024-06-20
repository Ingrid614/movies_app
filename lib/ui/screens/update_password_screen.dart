import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/gap.dart';

class UpdatePasswordScreen extends StatelessWidget{
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("update_password_title").tr(),
       leading: IconButton(
         icon:const Icon(Icons.arrow_back,),
       onPressed: (){
           Navigator.pop(context);
       },)
     ),
     body: Padding(
       padding: const EdgeInsets.all(8),
       child: SafeArea(
         child: Column(
           children: [
             const Gap(size: 74,),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "enter_old_password".tr(),
               ),
             ),
             const Gap(size: 20,),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "enter_new_password".tr(),
               ),
             ),
             const Gap(size: 20,),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "confirm_password".tr()
               ),
             ),
             const Gap(),
             Align(
               alignment: Alignment.centerLeft,
               child:InkWell(
               onTap: (){},
               child: const Text(
                   "forgot_password",
               style: TextStyle(
                 color: Colors.deepPurple,
                 decoration: TextDecoration.underline,
               ),
               ).tr(),
             ),
       ),
             const Gap(size: 20,),
             ElevatedButton(
                 onPressed:(){},
                 child: const Text(
                     "register",
                 style: TextStyle(
                   color: Colors.white
                 ),
                 ).tr()
             )
           ],
         ),
       ),
     ),
   );
  }

}
