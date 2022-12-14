import 'package:flutter/material.dart';
import 'package:hiking_dairy/viewModels/provider/dairy_provider.dart';
import 'package:hiking_dairy/viewModels/provider/mountain_provider.dart';
import 'package:hiking_dairy/views/detail_screen.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';
import 'package:hiking_dairy/views/bottom_nav_bar.dart';
import 'package:hiking_dairy/views/home_screen.dart';
import 'package:hiking_dairy/views/information_screen.dart';
import 'package:hiking_dairy/views/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => DairyProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => MountainProvider(),
    ),
  ], child: const HikingDairy()));
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
        BottomNavBar.routeName: (context) => const BottomNavBar(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        FormDairy.routeName: (context) => const FormDairy(),
        Information.routeName: (context) => const Information(),
        DetailScreen.routeName: (context) => const DetailScreen(),
      },
    );
  }
}
