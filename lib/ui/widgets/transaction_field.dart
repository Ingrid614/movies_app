import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ludokin_agent/ui/widgets/camera.dart';
import 'package:ludokin_agent/ui/widgets/qr_scanner.dart';

import '../routes/routes.dart';
import 'gap.dart';

class TransactionField extends StatefulWidget{
  final String appBarTitle;
  TransactionField({Key? key, required this.appBarTitle }):super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionFieldState(appBarTitle: appBarTitle);

}

class TransactionFieldState extends State<TransactionField>{

  TransactionFieldState({required this.appBarTitle});
  final String appBarTitle;

  late TextEditingController proofController;
  TextEditingController kinAdressController= TextEditingController();

 DateTime selectedDate= DateTime.now();
 // final DateFormat format = DateFormat('dd-MM-yyyy');

 Future<void> configureFilePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if(result != null){
    File file = File(result.files.single.path??'');
    PlatformFile  file1 = result.files.first;
    proofController.text=result.files.first.name;
    setState(() {});
  }else{

  }

 }





 @override
  void initState() {
    super.initState();

    proofController=TextEditingController();

  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       resizeToAvoidBottomInset: false,
     appBar: AppBar(
       title: Text(appBarTitle),
       leading: IconButton(
         icon: Icon(Icons.arrow_back,color: Colors.deepPurple),
         onPressed: (){
           Navigator.pushReplacementNamed(context, Routes.bottomnavbar);
         },
       ),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8),
       child: SafeArea(
           child:Column(
              children: [
              Gap(size:60),
            Row(
              children:[
                Expanded(
                  child: TextField(
                    controller: kinAdressController,
             obscureText: false,
             decoration: InputDecoration(
               labelText: "kin_adress".tr(),
             ),
           ),
       ),
                Gap(),
                IconButton(
                    onPressed: (){

                 Navigator.pushReplacementNamed(context, Routes.scan);
                      },
                    icon: SvgPicture.asset('assets/images/scan-outlined.svg',color: Color(0xff818181),)),
            ]),
            Gap(),
            TextField(
             obscureText: false,
             decoration: InputDecoration(
               labelText: "whatsapp_number".tr()
             ),
           ),
            Gap(),
            TextField(
             obscureText: false,
               decoration: InputDecoration(
                 labelText: "e_mail".tr()
               ),
           ),
            Gap(),
            TextField(
             obscureText: false,
             decoration: InputDecoration(
               labelText: "name".tr()
             ),
           ),
           Gap(),
           TextField(
             obscureText: false,
             decoration: InputDecoration(
               labelText: "amount".tr()
             ),
           ),
           Gap(),

           Row(
             children: [
               Expanded(
                   child: Container(
                     width: 70,
                       child:TextField(
                  controller: proofController,
                 obscureText: false,
                 readOnly: true,
                 decoration: InputDecoration(
                   labelText: "proof".tr(),
                 )

               )
       )
       )
       ,
               Gap(size:10),

                IconButton(
                     onPressed:(){
                     configureFilePicker();
                     },
                     icon: Icon(Icons.camera_alt_outlined, color: Color(0xff818181),)
                   )

    ] ),

           Gap(),
           ElevatedButton(
               onPressed: (){},
               child: Text(
                 "send",
                 style: TextStyle(
                   color: Colors.white
                 )
               ).tr()
           ),


         
         ],
       )
     )
     )
   );
  }
  
}