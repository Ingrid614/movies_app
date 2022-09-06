import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/splash_cubit.dart';

import '../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().isLoggedIn();
    return Scaffold(
      body: SafeArea(
          child: BlocListener<SplashCubit, bool>(
              listener: (BuildContext ctx, bool loggedIn) {
                if (loggedIn) {
                  // context.read<SplashCubit>().isLoggedIn();
                  Navigator.pushReplacementNamed(context, Routes.onboarding);
                } else {
                  Navigator.pushReplacementNamed(context, Routes.login);
                }
              },
              child: Expanded(
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.deepPurple,
                    child: Center(
                      child: Image.asset('assets/images/Saction Logo UNO-01.png',color: Colors.white),
              )
              )
          )
    )
        ),

    );
  }
}
