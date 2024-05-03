import 'package:flutter/material.dart';

import 'pages/register.dart';
import 'pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Lantis Ticketing App",
      initialRoute: '/',
      routes: {
        '/': (context) => const login(),
        '/register': (context) => const register(),
      },
    )
  );
}