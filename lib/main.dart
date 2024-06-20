import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ludokin_agent/ui/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ludokin_agent/ui/themes/themes.dart';
import 'business/cubit/command_cubit/movie_cubit.dart';
import 'business/cubit/theme_cubit.dart';

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
    print(id);
    return AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, lightTheme) =>

             MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => MovieCubit()),
                BlocProvider(create: (_) => LocaleCubit(const Locale('french'))),
                BlocProvider(create: (_) => ThemeCubit(AdaptiveThemeMode.light))

              ],
              child: MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  title: 'Kinkiosk',
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  initialRoute: '/',
                  routes: Routes.routes(context),
                  home: HomeScreen()
              ),
            )
            );

  }
}
