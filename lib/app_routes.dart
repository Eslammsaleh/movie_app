import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/browse.dart';
import 'package:flutter_application_1/layout/home.dart';
import 'package:flutter_application_1/layout/profile/profile.dart';
import 'package:flutter_application_1/layout/search.dart';
import 'screens/onbording_screen.dart';
import 'screens/splashscreen.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/main_page.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String search = '/search';
  static const String browse = '/browse';
  static const String profile = '/profile';
  static const String main = '/main';

  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const OnBoardingScreen(),
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(),
    splash: (context) => const SplashScreen(),
    home: (context) => const Home(),
    search: (context) => const Search(),
    browse: (context) => const Browse(),
    profile: (context) => const Profile(),
    main: (context) => const MainPage(),
  };
}
