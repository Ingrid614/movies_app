import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../routes/routes.dart';
import '../widgets/gap.dart';

class UpdatePasswordScreen extends StatelessWidget{
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("update_password_title").tr(),
       leading: IconButton(
         icon:Icon(Icons.arrow_back,color: Colors.deepPurple,),
       onPressed: (){
           Navigator.pop(context);
       },)
     ),
     body: Padding(
       padding: const EdgeInsets.all(8),
       child: SafeArea(
         child: Column(
           children: [
             Gap(size: 74,),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "enter_old_password".tr(),
               ),
             ),
             Gap(size: 20,),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "enter_new_password".tr(),
               ),
             ),
             Gap(size: 20,),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "confirm_password".tr()
               ),
             ),
             Gap(),
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
             Gap(size: 20,),
             ElevatedButton(
                 onPressed:(){},
                 child: Text(
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
