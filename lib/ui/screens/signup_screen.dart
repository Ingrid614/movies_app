import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../widgets/gap.dart';
import '../widgets/password_field.dart';
class SignUpScreen extends StatefulWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpScreenState();


}

class SignUpScreenState extends State<SignUpScreen>{


  DateTime selectedDate= DateTime.now();
  final DateFormat format = DateFormat('dd-MM-yyyy');
  TextEditingController controller = TextEditingController();


  Future<void> selectDate(BuildContext context)async {
    final DateTime? picked= await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if(picked!=null && picked!=selectedDate){
      selectedDate=picked;
      final String Date= format.format(selectedDate);
      controller.text = Date;
      setState(() {});
    }

  }

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
              Row(
                  children:[
                    Expanded(
                      child: TextField(
                controller: controller,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "date_of_birth".tr(),
                ),
              ),
                    ),
                    Gap(),
                    IconButton(
                        onPressed: (){
                          selectDate(context);                        },
                        icon: Icon(Icons.calendar_month_outlined)
                    )
                  ]),
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
                 onTap: (){
                   Navigator.pushReplacementNamed(context, Routes.login);
                 },
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


