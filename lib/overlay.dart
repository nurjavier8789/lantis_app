import 'package:flutter/material.dart';

import 'pagesSignedIn/home.dart';
import 'pagesSignedIn/resultSearch.dart';

int selectedIndex = 0;

class overlay extends StatefulWidget {
  const overlay({super.key});

  setIndex(int a) {
    selectedIndex = a;
  }

  @override
  State<overlay> createState() => _overlayState();
}

class _overlayState extends State<overlay> {
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
                resultSearch(),
                homess(),
              ],
            ),
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

            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/search");
              selectedIndex = 0;
            }
          },
          selectedItemColor: Color.fromARGB(255, 221, 180, 34),
          backgroundColor: Color.fromARGB(255, 234, 229, 229),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
