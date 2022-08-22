import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/gap.dart';
import '../widgets/password_field.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("sign_up").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: SingleChildScrollView(
            child:Column(
            children: [
              Gap(size: 40.0),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "name".tr(),
                ),
              ),
              Gap(),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "date_of_birth".tr(),
                ),
              ),
              Gap(),
              TextField(
                obscureText: false,

                decoration: InputDecoration(
                  labelText: "cni_number".tr(),
                ),
              ),
              const Gap(),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "whatsapp_number".tr(),
                ),
              ),
              const Gap(),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "point_of_sale".tr()
                ),
              ),
              const Gap(),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "user_name".tr(),
                ),
              ),
              Gap(),
              PasswordField(),
              Gap(),
              TextField(
                obscureText: true,
                  decoration: InputDecoration(
                    labelText: "confirm_password".tr(),
                  )
              ),
              Gap(size: 20.0,),
              ElevatedButton(
                  onPressed: (){},
                  child: const Text(
                    "sign_up",
                    style: TextStyle(color: Colors.white),
                  ).tr(),
              ),
               Gap(),
               InkWell(
                child: Text(
                  "already_have_account",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline,
                  ),
                ).tr(),
              )
            ],
          ),
        )
        ),
      )

    );
  }

  }


