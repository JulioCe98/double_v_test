import 'package:double_v_store/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:double_v_store/src/ui/screens/auth/auth_screen.dart';
import 'package:double_v_store/src/ui/screens/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Double V Store', initialRoute: 'onboarding', routes: {
      OnboardingScreen.routeName: (_) => const OnboardingScreen(),
      AuthScreen.routeName: (_) => const AuthScreen(),
      HomeScreen.routeName: (_) => const HomeScreen()
    });
  }
}
