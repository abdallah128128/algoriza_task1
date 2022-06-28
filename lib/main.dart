import 'package:algoriza_task1/app_router.dart';
import 'package:algoriza_task1/login_screen.dart';
import 'package:algoriza_task1/on_boarding.dart';
import 'package:algoriza_task1/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRouter.getRoutes(settings),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),

    );
  }
}

