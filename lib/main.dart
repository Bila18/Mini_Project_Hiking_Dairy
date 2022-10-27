import 'package:flutter/material.dart';
import 'package:hiking_dairy/views/welcome_screen.dart';

void main() {
  runApp(const HikingDairy());
}

class HikingDairy extends StatelessWidget {
  const HikingDairy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Dairy',
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
      },
    );
  }
}
