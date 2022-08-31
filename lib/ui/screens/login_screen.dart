import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ludokin_agent/ui/widgets/gap.dart';

import '../routes/routes.dart';
import '../widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  bool passwordVisible = false ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login').tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'user_name'.tr(),
                      ),
                    ),
                    const Gap(),





                    PasswordField(),



                    const Gap(),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){},
                        child:Text(
                        'forgot_password',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            decoration: TextDecoration.underline),
                      ).tr(),
                    )
                     ),
                    const Gap(size: 40.0,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.bottomnavbar);
                      },
                      child: const Text(
                        'login',
                        style: TextStyle(color: Colors.white),
                      ).tr(),

                    ),
                    const Gap(size: 20.0),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.signup);
                      },
                      child:Text(
                      'create_an_account',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                      ),
                    ).tr(),
                    )
                  ]),
            ),

          ),
        ));
  }


}
