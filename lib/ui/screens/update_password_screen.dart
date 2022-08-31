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
       title: Text("update_password_title").tr(),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8),
       child: SafeArea(
         child: Column(
           children: [
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "enter_old_password".tr(),
               ),
             ),
             Gap(),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "enter_new_password".tr(),
               ),
             ),
             Gap(),
             TextField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "confirm_password".tr()
               ),
             )
           ],
         ),
       ),
     ),
   );
  }

}
