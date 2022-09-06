import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../routes/routes.dart';
import '../widgets/gap.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileScreenState();


}

class ProfileScreenState extends State<ProfileScreen>{

final ImagePicker picker = ImagePicker();
late dynamic imageFile;

@override
  void initState() {
imageFile=AssetImage('assets/images/user-image.png');
  }

  Future<void> pickImageFromGallery() async {
  final XFile? image =await picker.pickImage(source: ImageSource.gallery);
  if(image!=null) {
    setState(() {
      imageFile =FileImage(File(image.path));

    });
  }
}
  Future<void> pickImageFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageFile =FileImage(File(image.path));
      });
    }
  }

  Future <void>chooseImageSource(){
   return showDialog(context: context, builder:(BuildContext context)
   {
     return AlertDialog(
         title: const Text(
           "CHOOSE OPTION", style: TextStyle(color: Colors.deepPurple),),
         content: SingleChildScrollView(
           child: ListBody(
               children: [
                 const Divider(height: 1, color: Colors.deepPurple,),
                 ListTile(
                   onTap: () {
                     pickImageFromGallery();
                   },
                   title: const Text("Gallery"),
                   leading: const Icon(Icons.image, color: Colors.deepPurple,),
                 ),
                 ListTile(
                   onTap: () {
                     pickImageFromCamera();
                   },
                   title: Text("Camera"),
                   leading: const Icon(
                     Icons.camera_alt_outlined, color: Colors.deepPurple,),
                 )

               ]),
         )
     );
   });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("profile").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 152,
                width: 375,
                child: Column(
                  children: [
                    Card(
                  color: Colors.deepPurple,

                      child:Column(
                          children:[
                            Row(
                            children:[
                              Gap(),
                               InkWell(

                                child:CircleAvatar(
                                 radius: 40,
                                  foregroundImage: imageFile ,
                       ),
                                onTap: (){
                                  chooseImageSource();
                                },
                              ),


                               Gap(),
                                 Column(
                                  children: [
                                    Gap(size: 20,),
                                    const Text("user_name",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                      ).tr(),
                                    const Text("e_mail",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                      ).tr()
                                    ,
                                    Gap(size:40),
                                    Center(
                                          child: Row(
                                              children:const [
                                                Icon(Icons.place_outlined,
                                                  color: Colors.white,),
                                                Text(
                                                  "Localisation",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                )
                                              ])
                                      )],
                                 )

                              ]),
                            //
                    ])

                ),
                       ]),
              ),
              Gap(),
              ListTile(
                title: const Text(
                  "update_account",
                style: TextStyle(
                  color: Colors.deepPurple
                ),
                ).tr(),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.deepPurple,
                ),
                onTap: (){
                  Navigator.pushNamed(context, Routes.updateaccount);
                },
              ),
              Gap(),
              ListTile(
                title: const Text(
                  "update_password",
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                ).tr(),
                    trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.deepPurple,
                ),
                onTap: (){
                  Navigator.pushNamed(context, Routes.updatepassword);
                },
              ),
              const Gap(),

                  ListTile(
                     title: const Text(
                    "recruited_persons",
                    style: TextStyle(
                      color: Colors.deepPurple
                    )
                    ).tr(),
                    trailing:const Text("xxxx",
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                    )
                  ),
              Gap(),

              const ListTile(
                title: Text(
                  "commission",
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                ),
                trailing: Text(
                  "xxxx",
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                ),
              ),
              Gap(),
              ListTile(
                textColor: Colors.deepPurple,
                title: Text("kin_address").tr(),
                trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.deepPurple,
              ),
                onTap: (){
                  Navigator.pushNamed(context, Routes.kinaddress);
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
