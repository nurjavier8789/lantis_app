import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pagesSignedIn/ticketSelected/paymentSuccess.dart';
import 'pagesSignedIn/ticketSelected/ticketDetail.dart';
import 'pagesSignedIn/ticketSelected/payment.dart';
import 'pagesSignedIn/search.dart';
import 'pages/forgorPass.dart';
import 'pages/register.dart';
import 'pages/login.dart';
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
        '/search': (context) => const searchPage(),
        '/detailTiket': (context) => const ticketDetails(),
        '/paymentMethod': (context) => const paymentMethod(),
        '/paymentSuccess': (context) => const paymentSuccess(),
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