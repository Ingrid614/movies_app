import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/auth_cubit/auth_cubit.dart';
import 'package:ludokin_agent/business/cubit/auth_cubit/login_state.dart';
import 'package:ludokin_agent/ui/widgets/gap.dart';
import 'package:ludokin_agent/ui/widgets/kin_snackbar.dart';

import '../routes/routes.dart';
import '../widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  bool passwordVisible = false ;
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
   final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login').tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:BlocConsumer<AuthCubit,LoginState>(
                listener: (BuildContext context, LoginState state){
                  if(state is LoginFailed){
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    showErrorSnack(context, state.message);
                  }
                  if(state is LoggedIn){
                    showSuccessSnack(context,'loginSuccess'.tr());
                    Navigator.pushReplacementNamed(context, Routes.bottomnavbar,arguments: state.user);
                  }
                  if (state is LoggingIn){
                    showSuccessSnack(context, "loggingIn".tr());
                  }

                },
                builder: (BuildContext context,LoginState state) {
                  switch (state.runtimeType) {
                    case LoggingIn:
                    return const Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
                    case InitialLoginState:
                      return Form(
                        key: _formKey,
                        child: Center(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                  'assets/images/Saction Logo UNO-01.png',
                                  color: Colors.deepPurple),
                            ),
                            TextFormField(
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
                              controller: _emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'e_mail'.tr(),
                              ),

                            ),
                            const Gap(),
                            PasswordField(passwordController: _passwordController,),
                            const Gap(),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {},
                                  child: const Text(
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
                                if(_formKey.currentState!.validate()) {

                                  Object data = {
                                    'email': _emailController.text.trim(),
                                    'password': _passwordController.text.trim()
                                  };
                                  context.read<AuthCubit>().login(data);
                                }
                              },
                              child: const Text(
                                'login',
                                style: TextStyle(color: Colors.white),
                              ).tr(),

                            ),
                            const Gap(size: 20.0),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.signup);
                              },
                              child: const Text(
                                'create_an_account',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  decoration: TextDecoration.underline,
                                ),
                              ).tr(),
                            )
                          ]),
                  ),
                      );
                    default:
                      return Form(
                        key: _formKey,
                        child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                      'assets/images/Saction Logo UNO-01.png',
                                      color: Colors.deepPurple),
                                ),
                                TextFormField(
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
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'e_mail'.tr(),
                                  ),
                                ),
                                const Gap(),
                                PasswordField(passwordController: _passwordController,),
                                const Gap(),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Text(
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
                                    if(_formKey.currentState!.validate()) {
                                      Object data = {
                                        'email': _emailController.text.trim(),
                                        'password': _passwordController.text.trim()
                                      };
                                      context.read<AuthCubit>().login(data);
                                    }
                                  },
                                  child: const Text(
                                    'login',
                                    style: TextStyle(color: Colors.white),
                                  ).tr(),

                                ),
                                const Gap(size: 20.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.signup);
                                  },
                                  child: const Text(
                                    'create_an_account',
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ).tr(),
                                )
                              ]),
                        ),
                      );
                }
                }
            )
          )

          ),
        ));
  }


}
