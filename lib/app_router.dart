import 'package:algoriza_task1/login_screen.dart';
import 'package:algoriza_task1/on_boarding.dart';
import 'package:algoriza_task1/register_screen.dart';
import 'package:flutter/material.dart';


class AppRouter{

  static Route<dynamic>? getRoutes(RouteSettings settings) {
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) =>  const OnBoardingScreen(),);
      case '/login':
        return MaterialPageRoute(builder: (context) =>  LoginScreen(),);
      case '/register':
        return MaterialPageRoute(builder: (context) =>  RegisterScreen(),);


    }
  }
}