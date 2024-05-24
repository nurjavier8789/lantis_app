import 'package:flutter/material.dart';

import 'pagesSignedIn/home.dart';
import 'function/widgets.dart';

class overlay extends StatefulWidget {
  const overlay({super.key});

  @override
  State<overlay> createState() => _overlayState();
}

class _overlayState extends State<overlay> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: const <Widget>[
                homess(),
                homess(),
                homess(),
              ],
            ),
            widgetss().TopApp(),
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/outline_home.png"),
              activeIcon: Image.asset("assets/home_coloured.png"),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search),
              label: 'Cari',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/trans_history.png"),
              activeIcon: Image.asset("assets/trans_history.png"),
              label: 'Transaksi',
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: Color.fromARGB(255, 221, 180, 34),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
