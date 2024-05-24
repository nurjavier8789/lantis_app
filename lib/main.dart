import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/register.dart';
import 'pages/login.dart';
import 'pages/forgorPass.dart';
import 'overlay.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Lantis Ticketing App",
      initialRoute: '/overlay',
      routes: {
        '/': (context) => const login(),
        '/register': (context) => const register(),
        '/forgetPass': (context) => const forgorPass(),
        '/overlay': (context) => const overlay(),
      },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.white
            )
          )
        ),
    )
  );
}