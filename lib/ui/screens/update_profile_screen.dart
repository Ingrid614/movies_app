import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../routes/routes.dart';
import '../widgets/gap.dart';
import '../widgets/password_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UpdataProfileScreenState();
}
class UpdataProfileScreenState extends State<UpdateProfileScreen>{

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
          title: Text("update_account_title").tr(),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back, color: Colors.deepPurple,)),
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
                    Gap(size: 20.0,),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text(
                        "update",
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                    ),
                    Gap(),

                  ],
                ),
              )
          ),
        )

    );
  }

}