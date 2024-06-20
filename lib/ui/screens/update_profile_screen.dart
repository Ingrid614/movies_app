import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubit/auth_cubit/update_cubit.dart';
import '../../business/cubit/auth_cubit/update_state.dart';
import '../routes/routes.dart';
import '../widgets/gap.dart';
import '../widgets/kin_snackbar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UpdateProfileScreenState();
}
class UpdateProfileScreenState extends State<UpdateProfileScreen>{

  DateTime selectedDate= DateTime.now();
  final DateFormat format = DateFormat('yyyy-MM-dd');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cniNumController = TextEditingController();
  final TextEditingController _comNumController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();


  Future<void> selectDate(BuildContext context)async {
    final DateTime? picked= await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if(picked!=null && picked!=selectedDate){
      selectedDate=picked;
      final String date= format.format(selectedDate);
      _dateController.text = date;
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("update_account_title").tr(),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
              icon: const Icon(Icons.arrow_back,)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
              child: SingleChildScrollView(
                child: BlocConsumer<UpdateCubit,UpdateState>(
                  listener: (BuildContext context, UpdateState state){
                    if(state is UpdateFailed){
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      showErrorSnack(context, state.message);
                    }
                    if(state is Updated){
                      showSuccessSnack(context,'updateSuccess'.tr());
                      Navigator.pushReplacementNamed(context, Routes.bottomnavbar,arguments: state.user);
                    }
                    if(state is Updating){
                      showSuccessSnack(context,'updating'.tr());
                    }
                  },
                  builder: (BuildContext context, UpdateState state){
                    switch(state.runtimeType){
                      case InitialUpdateState:
                        return Column(
                          children: [
                            const Gap(size: 40.0),
                            TextField(
                              obscureText: false,
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "name".tr(),
                              ),
                            ),
                            const Gap(),
                            Row(
                                children:[
                                  Expanded(
                                    child: TextField(
                                      controller: _dateController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: "date_of_birth".tr(),
                                      ),
                                    ),
                                  ),
                                  const Gap(),
                                  IconButton(
                                      onPressed: (){
                                        selectDate(context);                        },
                                      icon: const Icon(Icons.calendar_month_outlined)
                                  )
                                ]),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _cniNumController,
                              decoration: InputDecoration(
                                labelText: "cni_number".tr(),
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _comNumController,
                              decoration: InputDecoration(
                                labelText: "whatsapp_number".tr(),
                              ),
                            ),
                            const Gap(),
                            TextField(
                              obscureText: false,
                              controller: _placeController,
                              decoration: InputDecoration(
                                  labelText: "point_of_sale".tr()
                              ),
                            ),
                            const Gap(),
                            const Gap(size: 20.0,),
                            ElevatedButton(
                              onPressed: (){
                                Object data = {
                                  'name' : _nameController.text.trim(),
                                  'numero_CNI': _cniNumController.text.trim(),
                                  'numero_commercial': _comNumController.text.trim(),
                                  'date_de_naissance': _dateController.text.trim(),
                                  'localisation': _placeController.text.trim()
                                };

                                context.read<UpdateCubit>().updateUser(data);
                              },
                              child: const Text(
                                "update",
                                style: TextStyle(color: Colors.white),
                              ).tr(),
                            ),
                            const Gap(),

                          ],
                        );
                      case Updating :
                        return const Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
                      default:
                        return Column(
                        children: [
                          const Gap(size: 40.0),
                          TextField(
                            obscureText: false,
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "name".tr(),
                            ),
                          ),
                          const Gap(),
                          Row(
                              children:[
                                Expanded(
                                  child: TextField(
                                    controller: _dateController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "date_of_birth".tr(),
                                    ),
                                  ),
                                ),
                                const Gap(),
                                IconButton(
                                    onPressed: (){
                                      selectDate(context);                        },
                                    icon: const Icon(Icons.calendar_month_outlined)
                                )
                              ]),
                          const Gap(),
                          TextField(
                            obscureText: false,
                            controller: _cniNumController,
                            decoration: InputDecoration(
                              labelText: "cni_number".tr(),
                            ),
                          ),
                          const Gap(),
                          TextField(
                            obscureText: false,
                            controller: _comNumController,
                            decoration: InputDecoration(
                              labelText: "whatsapp_number".tr(),
                            ),
                          ),
                          const Gap(),
                          TextField(
                            obscureText: false,
                            controller: _placeController,
                            decoration: InputDecoration(
                                labelText: "point_of_sale".tr()
                            ),
                          ),
                          const Gap(),
                          const Gap(size: 20.0,),
                          ElevatedButton(
                            onPressed: (){
                              Object data = {
                                'name' : _nameController.text.trim(),
                                'numero_CNI': _cniNumController.text.trim(),
                                'numero_commercial': _comNumController.text.trim(),
                                'date_de_naissance': _dateController.text.trim(),
                                'localisation': _placeController.text.trim()
                              };

                              context.read<UpdateCubit>().updateUser(data);
                            },
                            child: const Text(
                              "update",
                              style: TextStyle(color: Colors.white),
                            ).tr(),
                          ),
                          const Gap(),

                        ],
                      );
                    }

                  }
                )
              )
          ),
        )

    );
  }

}