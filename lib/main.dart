import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/business/cubit/splash_cubit.dart';
import 'package:ludokin_agent/ui/routes/routes.dart';
import 'package:ludokin_agent/ui/screens/bottom_navigation_bar_screen.dart';
import 'package:ludokin_agent/ui/screens/buy_screen.dart';
import 'package:ludokin_agent/ui/screens/home_screen.dart';
import 'package:ludokin_agent/ui/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ludokin_agent/ui/screens/sell_screen.dart';
import 'package:ludokin_agent/ui/screens/settings_screen.dart';
import 'package:ludokin_agent/ui/screens/signup_screen.dart';
import 'package:ludokin_agent/ui/themes/themes.dart';
import 'package:ludokin_agent/ui/widgets/camera.dart';
import 'package:ludokin_agent/ui/widgets/qr_scanner.dart';

import 'business/cubit/password_visible.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('fr')],
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            // initialRoute: '/',
            // routes: Routes.routes(context),
            home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => SplashCubit()..isLoggedIn()),
                BlocProvider(create: (_) => PasswordVisibleCubit()..togglePasswordVisible())
              ],
              child: MaterialApp(
                initialRoute: '/',
                routes: Routes.routes(context),
                home: LoginScreen(),
              ),
            )
            // home: const SplashScreen(),
            ));
  }
}
