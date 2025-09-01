import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/home_page.dart';
import 'package:flutter_application_1/screens/onbording_screen.dart';

import 'package:flutter_application_1/screens/splashscreen.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splash = '/splash';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const OnBoardingScreen(),
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(),
    splash: (context) => const SplashScreen(),
    home:(context)=>const HomePage(),
  };
}
