import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/password_visible.dart';

class PasswordField extends StatelessWidget{
  PasswordField({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<PasswordVisibleCubit,bool>(
       builder:(_, bool visible) {
     return TextFormField(

       decoration: InputDecoration(
         labelText: "password".tr(),
         suffixIcon: IconButton(
          onPressed: (){context.read<PasswordVisibleCubit>().togglePasswordVisible();},
          icon:  Icon(visible? Icons.visibility_rounded: Icons.visibility_off_rounded),
         ),

     ),
       obscureText: !visible,
     );
   });
  }

}