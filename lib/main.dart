import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/splash_cubit.dart';
import 'package:ludokin_agent/ui/routes/routes.dart';
import 'package:ludokin_agent/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: Routes.routes(context),
        home: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => SplashCubit()..isLoggedIn())],
          child: const SplashScreen(),
        )
        // home: const SplashScreen(),
        );
  }
}
