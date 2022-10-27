import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';
import 'package:hiking_dairy/views/home_screen.dart';
import 'package:hiking_dairy/views/information_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/navBar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final screen = [
    const HomeScreen(),
    const FormDairy(),
    const Information(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          backgroundColor: Colors.white,
          color: Color.fromARGB(255, 93, 70, 41),
          items: const [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.info,
              size: 30,
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            ;
            // if (value == 0)
            //   Navigator.of(context).pushNamed(HomeScreen.routeName);
            // if (value == 1)
            //   Navigator.of(context).pushNamed(FormDairy.routeName);
            // if (value == 1)
            //   Navigator.of(context).pushNamed(Information.routeName);
          }),
    );
  }
}
