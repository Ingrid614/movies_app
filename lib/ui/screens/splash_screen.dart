import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: BlocListener<SplashCubit, bool>(
              listener: (BuildContext ctx, bool loggedIn) {
                if (loggedIn) {
                  print("logged in");
                } else {
                  print("not logged in");
                }
              },
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<SplashCubit>().isLoggedIn();
                    },
                    child: const Text("Change State")),
              )),
        ),
      ),
    );
  }
}
