import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_e_commerce_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
