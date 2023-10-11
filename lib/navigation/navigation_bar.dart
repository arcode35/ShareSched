import 'package:flutter/material.dart';
import 'package:myapp/pages/custom_widgets.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/friends.dart';

import 'package:myapp/pages/qrcode.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;

  final Screens = [
    const HomeScreen(),
    FriendScreen(),
    const QRScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Screens[_currentIndex],
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.black,
          unselectedItemColor: Color.fromARGB(255, 141, 141, 141),
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/page-1/images/custom/home.png'),
                  size: 24,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.group,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: '',
            ),
          ],
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
