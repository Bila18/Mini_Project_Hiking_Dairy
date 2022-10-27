import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hiking_dairy/views/bottom_nav_bar.dart';
import 'package:hiking_dairy/views/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final quote = [
      const Text(
        '"Write Youre Hiking Journey"',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
      const Text(
        '"Life is a collection of moments"',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
      const Text(
        '"Little things mean a lot"',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const Image(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1611243017235-84454d0491aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                ),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 400,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: quote,
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Color.fromARGB(255, 93, 70, 41),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(BottomNavBar.routeName),
                    child: const Text('Get Started'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
