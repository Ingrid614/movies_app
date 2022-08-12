import 'package:ludokin_agent/ui/screens/account_screen.dart';
import 'package:ludokin_agent/ui/screens/buykin_screen.dart';
import 'package:ludokin_agent/ui/screens/home_screen.dart';
import 'package:ludokin_agent/ui/screens/login_screen.dart';
import 'package:ludokin_agent/ui/screens/settings_screen.dart';
import 'package:ludokin_agent/ui/screens/updateaccount_screen.dart';
import 'package:ludokin_agent/ui/screens/updatepassword_screen.dart';

import '../screens/chat_screen.dart';
import '../screens/sellkin_screen.dart';
import '../screens/signup_screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String sellkin = '/sellkin';
  static const String buykin = '/buykin';
  static const String chat = '/chat';
  static const String settings = '/settings';
  static const String account = '/account';
  static const String updateaccount = '/updateaccount';
  static const String updatepassword = '/updatepassword';

  static routes(context){
    return {
      '/login': (context) => const LoginScreen(),
      '/signup': (context) => const SignUpScreen(),
      '/home': (context) => const HomeScreen(),
      '/sellkin': (context) => const SellKinScreen(),
      '/buykin': (context) => const BuyKinScreen(),
      '/chat': (context) => const ChatScreen(),
      '/settings': (context) => const SettingsScreen(),
      '/account': (context) => const AccountScreen(),
      '/updateaccount': (context) => const UpdateAccountScreen(),
      '/updatepassword': (context) => const UpdatePasswordScreen()
    };
  }
}