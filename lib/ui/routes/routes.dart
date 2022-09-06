import 'package:ludokin_agent/ui/screens/bottom_navigation_bar_screen.dart';
import 'package:ludokin_agent/ui/screens/inbox_screen.dart';
import 'package:ludokin_agent/ui/screens/onboarding.dart';
import 'package:ludokin_agent/ui/screens/profile_screen.dart';
import 'package:ludokin_agent/ui/screens/buy_screen.dart';
import 'package:ludokin_agent/ui/screens/home_screen.dart';
import 'package:ludokin_agent/ui/screens/login_screen.dart';
import 'package:ludokin_agent/ui/screens/qr_code_screen.dart';
import 'package:ludokin_agent/ui/screens/settings_screen.dart';
import 'package:ludokin_agent/ui/screens/update_profile_screen.dart';
import 'package:ludokin_agent/ui/screens/update_password_screen.dart';
import 'package:ludokin_agent/ui/widgets/qr_scanner.dart';

import '../screens/chat_screen.dart';
import '../screens/sell_screen.dart';
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
  static const String scan= '/scan';
  static const String bottomnavbar='/bottomnavbar';
  static const String inbox='/inbox';
  static const String kinaddress='/kinaddress';
  static const String onboarding='/onboarding';

  static routes(context){
    return {
      '/login': (context) =>  LoginScreen(),
      '/signup': (context) => const SignUpScreen(),
      '/home': (context) => const HomeScreen(),
      '/sellkin': (context) => const SellScreen(),
      '/buykin': (context) => const BuyScreen(),
      '/chat': (context) =>  ChatScreen(),
      '/settings': (context) => const SettingsScreen(),
      '/account': (context) => const ProfileScreen(),
      '/updateaccount': (context) => const UpdateProfileScreen(),
      '/updatepassword': (context) => const UpdatePasswordScreen(),
      '/scan': (context) => const QRViewExample(),
      '/bottomnavbar':(context) => BottomNavigationBarScreen(),
      '/inbox':(context) => InboxScreen(),
      '/kinaddress':(context) => QrCodeScreen(),
      '/onboarding':(context) => OnboardingPages()
    };
  }
}