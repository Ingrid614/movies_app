import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ludokin_agent/ui/widgets/kin_snackbar.dart';
import '../../business/cubit/command_cubit/command_cubit.dart';
import '../../business/cubit/command_cubit/command_state.dart';
import '../routes/routes.dart';
import '../widgets/gap.dart';

class BuyScreen extends StatefulWidget{
  // final String appBarTitle;
  const BuyScreen({Key? key,}):super(key: key);

  @override
  State<StatefulWidget> createState() => BuyScreenState();

}

class BuyScreenState extends State<BuyScreen>{

  // TransactionFieldState({required this.appBarTitle});
  // final String appBarTitle;

  final box = GetStorage();
  final TextEditingController _kinAdressController= TextEditingController();
  final TextEditingController _numController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _amountController= TextEditingController();
  final TextEditingController _proofController= TextEditingController();

  DateTime selectedDate= DateTime.now();
  var dropDownItemsOptions = ["cash".tr(),"transfer".tr()];
  String dropDownValue ="type_payment".tr();


  Future<void> configureFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      File file = File(result.files.single.path??'');
      PlatformFile  file1 = result.files.first;
      _proofController.text=result.files.first.name ;
      setState(() {});
    }else{

    }

  }

  Future<void> pickImageFromCamera() async {
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _proofController.text= image.name;

      });
    }
  }

  Future <void>chooseImageSource(){
    return showDialog(context: context, builder:(BuildContext context)
    {
      return AlertDialog(
          title: const Text(
            "CHOOSE OPTION", ),
          content: SingleChildScrollView(
            child: ListBody(
                children: [
                  const Divider(height: 1, color: Colors.deepPurple,),
                  ListTile(
                    onTap: () {
                      configureFilePicker();
                      Navigator.pop(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(Icons.image, color: Colors.deepPurple,),
                  ),
                  ListTile(
                    onTap: () {
                      pickImageFromCamera();
                      Navigator.pop(context);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera_alt_outlined, color: Colors.deepPurple,),
                  )

                ]),)
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('buy'.tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,),
            onPressed: (){
              Navigator.pushReplacementNamed(context, Routes.bottomnavbar);
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: SafeArea(
              child: BlocConsumer<CommandCubit,CommandState>(
                  listener: (BuildContext context, CommandState state){
                    if(state is SendingFailed){
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      showErrorSnack(context, state.message);
                    }
                    if(state is CommandSent){
                      showSuccessSnack(context, 'commandSent'.tr());
                      Navigator.pushReplacementNamed(context, Routes.bottomnavbar);
                    }
                    if(state is SendingCommand){
                      showSuccessSnack(context, 'sendingCommand'.tr());
                    }
                  },
                  builder: (BuildContext context, CommandState state){
                    switch(state.runtimeType) {
                      case SendingCommand:
                        return const Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
                      case InitialCommandState:
                        return Column(
                          children: [
                            const Gap(size: 60),
                            Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _kinAdressController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: "kin_address".tr(),
                                      ),
                                    ),
                                  ),
                                  const Gap(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, Routes.scan);
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/images/qr-scan-line.svg',

                                      )
                                  ),
                                ]),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _numController,
                              decoration: InputDecoration(
                                  labelText: "whatsapp_number".tr()
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _emailController,
                              decoration: InputDecoration(
                                  labelText: "e_mail".tr()
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _nameController,
                              decoration: InputDecoration(
                                  labelText: "name".tr()
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _amountController,
                              decoration: InputDecoration(
                                  labelText: "amount".tr()
                              ),
                            ),
                            const Gap(),
                            DropdownButton(
                                hint: Text(dropDownValue, ),
                                isExpanded: true,
                                elevation: 0,
                                items: dropDownItemsOptions.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                        )
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropDownValue = newValue!;
                                  });
                                }),
                            const Gap(),
                            Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          width: 70,
                                          child: TextField(
                                              controller: _proofController,
                                              obscureText: false,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: "proof".tr(),
                                              )

                                          )
                                      )
                                  ),
                                  const Gap(size: 10),

                                  IconButton(
                                      onPressed: () {
                                        chooseImageSource();
                                      },
                                      icon: const Icon(Icons.camera_alt_outlined,
                                       )
                                  )

                                ]),

                            const Gap(),
                            ElevatedButton(
                                onPressed: () {
                                  Object data = {
                                    'user_id': box.read('id').toString(),
                                    'adresse_kin': _kinAdressController.text.trim(),
                                    'montant': _amountController.text.trim(),
                                    'statut_id': "1",
                                    'numero_whatsapp': _numController.text.trim(),
                                    'email_client': _emailController.text.trim(),
                                    'nom_client': _nameController.text.trim()
                                  };
                                  context.read<CommandCubit>().newCommand(data);
                                },
                                child: const Text(
                                    "send",
                                    style: TextStyle(
                                        color: Colors.white
                                    )
                                ).tr()
                            ),


                          ],
                        );
                      default:
                        return Column(
                          children: [
                            const Gap(size: 60),
                            Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _kinAdressController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: "kin_address".tr(),
                                      ),
                                    ),
                                  ),
                                  const Gap(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, Routes.scan);
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/images/qr-scan-line.svg',

                                      )
                                  ),
                                ]),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _numController,
                              decoration: InputDecoration(
                                  labelText: "whatsapp_number".tr()
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _emailController,
                              decoration: InputDecoration(
                                  labelText: "e_mail".tr()
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _nameController,
                              decoration: InputDecoration(
                                  labelText: "name".tr()
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _amountController,
                              decoration: InputDecoration(
                                  labelText: "amount".tr()
                              ),
                            ),
                            const Gap(),
                            DropdownButton(
                                hint: Text(dropDownValue,),
                                isExpanded: true,
                                elevation: 0,
                                items: dropDownItemsOptions.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                        )
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropDownValue = newValue!;
                                  });
                                }),
                            const Gap(),
                            Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          width: 70,
                                          child: TextField(
                                              controller: _proofController,
                                              obscureText: false,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: "proof".tr(),
                                              )

                                          )
                                      )
                                  ),
                                  const Gap(size: 10),

                                  IconButton(
                                      onPressed: () {
                                        chooseImageSource();
                                      },
                                      icon: const Icon(Icons.camera_alt_outlined,
                                        )
                                  )

                                ]),

                            const Gap(),
                            ElevatedButton(
                                onPressed: () {
                                  Object data = {
                                    'user_id': box.read('id').toString(),
                                    'adresse_kin': _kinAdressController.text.trim(),
                                    'montant': _amountController.text.trim(),
                                    'statut_id': "1",
                                    'numero_whatsapp': _numController.text.trim(),
                                    'email_client': _emailController.text.trim(),
                                    'nom_client': _nameController.text.trim()
                                  };
                                  context.read<CommandCubit>().newCommand(data);
                                },
                                child: const Text(
                                    "send",
                                ).tr()
                            ),


                          ],
                        );
                    }

                  }),

            )
        )
    );
  }

}