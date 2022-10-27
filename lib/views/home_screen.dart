import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';
import 'package:hiking_dairy/views/information_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "My Dairy",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                // IconButton(
                //     onPressed: () {
                //       Navigator.of(context).pushNamed(FormDairy.routeName);
                //     },
                //     icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset('assets/camp.png'),
            const Text(
              'You Dairy Is Empty',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Let's Start Write Dairy",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
