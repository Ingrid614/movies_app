import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/splash_cubit.dart';
import 'package:ludokin_agent/ui/routes/routes.dart';
import 'package:ludokin_agent/ui/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Easylocalization.ensureInitialized();
  runApp(
    EazyLocalization(
      supportedLocales: [const Locale('en'), const Locale('fr'),
      path:'assets/translations',
      fallbackLocale: Locale('en'),
      UseFallbackTranslations: true,
      child:MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: Routes.routes(context),
        home: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => SplashCubit()..isLoggedIn())],
          child: const LoginScreen(),
        )
        // home: const SplashScreen(),
        );
  }
}
