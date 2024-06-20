import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/cubit/auth_cubit/signup_cubit.dart';
import '../../business/cubit/auth_cubit/signup_state.dart';
import '../../data/models/user.dart';
import '../routes/routes.dart';
import '../widgets/gap.dart';
import '../widgets/kin_snackbar.dart';
import '../widgets/password_field.dart';


class SignUpScreen extends StatefulWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpScreenState();


}

class SignUpScreenState extends State<SignUpScreen>{


  DateTime selectedDate= DateTime.now();
  final DateFormat format = DateFormat('yyyy-MM-dd');
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController cniNumberControlller = TextEditingController();
  TextEditingController whatsappNumberController = TextEditingController();
  TextEditingController localisationController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userCodeController = TextEditingController();
  TextEditingController parentCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      dateOfBirthController.text = date;
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("sign_up").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
           child: BlocConsumer<SignUpCubit,SignUpState>(
             listener: (BuildContext ctx, SignUpState state) {

               if (state is SignUpSuccess) {

                 Navigator.pushReplacementNamed(
                   context,
                   Routes.bottomnavbar,
                   arguments: state.user,
                 );
               }
               if (state is SignUpFailed) {
                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
                 showErrorSnack(context, state.message);
               }
               if (state is SigningUp){
                 showSuccessSnack(context, "signingUp".tr());
               }
             },
             builder: (BuildContext context, SignUpState state) {
               switch (state.runtimeType) {
                 case InitialSignUpState:
                   return Form(
                     key: _formKey,
                     child: Column(
                       children: [
                         const Gap(size: 40.0),
                         TextFormField(
                           controller: emailController,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: 'e_mail'.tr(),
                           ),
                           validator: (String? value){
                             bool emailValid = RegExp(
                                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                 .hasMatch(value!);
                             if (value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             if (!emailValid) {
                               return 'valid_email'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         Row(
                             children:[
                               Expanded(
                                 child: TextFormField(
                                   controller: dateOfBirthController,
                                   obscureText: false,
                                   decoration: InputDecoration(
                                     labelText: "date_of_birth".tr(),
                                   ),
                                   validator: (String? value){
                                     if (value == null || value.isEmpty) {
                                       return 'required_field'.tr();
                                     }
                                     return null;
                                   },
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
                         TextFormField(
                           controller: cniNumberControlller,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "cni_number".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: whatsappNumberController,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "commercial_number".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: localisationController,
                           obscureText: false,
                           decoration: InputDecoration(
                               labelText: "point_of_sale".tr()
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: userNameController,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "user_name".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         PasswordField(passwordController: passwordController),
                         const Gap(),
                         TextFormField(
                           controller: confirmPasswordController,
                           obscureText: true,
                           decoration: InputDecoration(
                             labelText: "confirm_password".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             if(value!= passwordController.text){
                               return 'error in password confirmation';
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: userCodeController,
                           obscureText: false,
                           decoration: InputDecoration(
                               labelText:"code_promo".tr()
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                             controller: parentCodeController,
                             obscureText: false,
                             decoration: InputDecoration(
                                 labelText:"code_parent".tr()
                             )
                         ),
                         const Gap(size: 20.0,),
                         ElevatedButton(
                           onPressed: (){
                             if(_formKey.currentState!.validate()) {
                               User user = User(
                                 email: emailController.text,
                                 password: passwordController.text,
                                 dateDeNaissance: dateOfBirthController.text,
                                 localisation: localisationController.text,
                                 name: userNameController.text,
                                 numeroCni: cniNumberControlller.text,
                                 numeroCommercial: whatsappNumberController.text,
                                 userCode: userCodeController.text,
                                 parentCode: parentCodeController.text,
                               );
                               dynamic c = context.read<SignUpCubit>();
                               print(c);
                               context.read<SignUpCubit>().register(user);
                             }
                           },
                           child: const Text(
                             "sign_up",
                             style: TextStyle(color: Colors.white),
                           ).tr(),
                         ),
                         const Gap(),
                         InkWell(
                           onTap: (){
                             Navigator.pushReplacementNamed(context, Routes.login);
                           },
                           child: const Text(
                             "already_have_account",
                             style: TextStyle(
                               color: Colors.deepPurple,
                               decoration: TextDecoration.underline,
                             ),
                           ).tr(),
                         )
                       ],
                     ),
                   );
                 case SigningUp:
                   return const Center(child: CircularProgressIndicator(color: Colors.deepPurple ,));
                 default:
                   return Form(
                     key: _formKey,
                     child: Column(
                       children: [
                         const Gap(size: 40.0),
                         TextFormField(
                           controller: emailController,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "email".tr(),
                           ),
                           validator: (String? value){
                             bool emailValid = RegExp(
                                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                 .hasMatch(value!);
                             if (value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             if (!emailValid) {
                               return 'valid_email'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         Row(
                             children:[
                               Expanded(
                                 child: TextFormField(
                                   controller: dateOfBirthController,
                                   obscureText: false,
                                   decoration: InputDecoration(
                                     labelText: "date_of_birth".tr(),
                                   ),
                                   validator: (String? value){
                                     if (value == null || value.isEmpty) {
                                       return 'required_field'.tr();
                                     }
                                     return null;
                                   },
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
                         TextFormField(
                           controller: cniNumberControlller,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "cni_number".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: whatsappNumberController,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "commercial_number".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: localisationController,
                           obscureText: false,
                           decoration: InputDecoration(
                               labelText: "point_of_sale".tr()
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: userNameController,
                           obscureText: false,
                           decoration: InputDecoration(
                             labelText: "user_name".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         PasswordField(passwordController: passwordController),
                         const Gap(),
                         TextFormField(
                           controller: confirmPasswordController,
                           obscureText: true,
                           decoration: InputDecoration(
                             labelText: "confirm_password".tr(),
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             if(value!= passwordController.text){
                               return 'error in password confirmation';
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                           controller: userCodeController,
                           obscureText: false,
                           decoration: InputDecoration(
                               labelText:"code_promo".tr()
                           ),
                           validator: (String? value){
                             if (value == null || value.isEmpty) {
                               return 'required_field'.tr();
                             }
                             return null;
                           },
                         ),
                         const Gap(),
                         TextFormField(
                             controller: parentCodeController,
                             obscureText: false,
                             decoration: InputDecoration(
                                 labelText:"code_parent".tr()
                             )
                         ),
                         const Gap(size: 20.0,),
                         ElevatedButton(
                           onPressed: (){
                             print('hello default');
                             if(_formKey.currentState!.validate()) {
                               User user = User(
                                 email: emailController.text,
                                 password: passwordController.text,
                                 dateDeNaissance: dateOfBirthController.text,
                                 localisation: localisationController.text,
                                 name: userNameController.text,
                                 numeroCni: cniNumberControlller.text,
                                 numeroCommercial: whatsappNumberController.text,
                                 userCode: userCodeController.text,
                                 parentCode: parentCodeController.text,

                               );
                               context.read<SignUpCubit>().register(user);
                             }
                           },
                           child: const Text(
                             "sign_up",
                             style: TextStyle(color: Colors.white),
                           ).tr(),
                         ),
                         const Gap(),
                         InkWell(
                           onTap: (){
                             Navigator.pushReplacementNamed(context, Routes.login);
                           },
                           child: const Text(
                             "already_have_account",
                             style: TextStyle(
                               color: Colors.deepPurple,
                               decoration: TextDecoration.underline,
                             ),
                           ).tr(),
                         )
                       ],
                     ),
                   );
               }
             },
           ),
        )
        ),
      )
    );
  }

  }


