import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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
  var dropDownItemsOptions = ["cash".tr(),"transfer".tr()];
  String dropDownValue ="type_payment".tr();


 Future<void> configureFilePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if(result != null){
    File file = File(result.files.single.path??'');
    PlatformFile  file1 = result.files.first;
    proofController.text=result.files.first.name ;
    setState(() {});
  }else{

  }

 }

  Future<void> pickImageFromCamera() async {
   ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        proofController.text= image.name;

      });
    }
  }

  Future <void>chooseImageSource(){
    return showDialog(context: context, builder:(BuildContext context)
    {
      return AlertDialog(
          title: Text(
            "CHOOSE OPTION", style: TextStyle(color: Colors.deepPurple),),
          content: SingleChildScrollView(
            child: ListBody(
                children: [
                  Divider(height: 1, color: Colors.deepPurple,),
                  ListTile(
                    onTap: () {
                      configureFilePicker();
                    },
                    title: Text("Gallery"),
                    leading: Icon(Icons.image, color: Colors.deepPurple,),
                  ),
                  ListTile(
                    onTap: () {
                      pickImageFromCamera();
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera_alt_outlined, color: Colors.deepPurple,),
                  )

                ]),)
      );
    });
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
               labelText: "kin_address".tr(),
             ),
           ),
       ),
                Gap(),
                IconButton(
                    onPressed: (){

                 Navigator.pushNamed(context, Routes.scan);
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
           DropdownButton(
                hint: Text(dropDownValue, style: TextStyle(color: Colors.deepPurple),),
                isExpanded: true,
                elevation: 0,
                items: dropDownItemsOptions.map((String items){
                return DropdownMenuItem(
                value: items,
                child: Text(items , style: TextStyle(color: Colors.deepPurple),)
                );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                }),
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
       ),
               Gap(size:10),

                IconButton(
                     onPressed:(){
                     chooseImageSource();
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