import 'package:flutter/material.dart';

class EmptyDairy extends StatelessWidget {
  const EmptyDairy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
