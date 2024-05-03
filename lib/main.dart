import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'pages/register.dart';
import 'pages/login.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.white,
  //   ),
  // );

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const login(),
        '/register': (context) => const register(),
      },
    )
  );
}