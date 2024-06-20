import 'package:ludokin_agent/ui/screens/onboarding.dart';
import 'package:ludokin_agent/ui/screens/home_screen.dart';

class Routes {
  static const String home = '/home';
  static const String onboarding='/onboarding';

  static routes(context){
    return {
      '/home': (context) =>   HomeScreen(),
      '/onboarding':(context) => const OnboardingPages()
    };
  }
}
