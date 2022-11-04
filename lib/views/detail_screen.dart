import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hiking_dairy/models/dairy.dart';
import 'package:hiking_dairy/viewModels/provider/dairy_provider.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Dairy? getDairy;
  String name = '';
  String location = '';
  String date = '';
  String dairy = '';
  String pic = '';
  @override
  Widget build(BuildContext context) {
    getDairy = ModalRoute.of(context)!.settings.arguments as Dairy?;
    if (getDairy != null) {
      name = getDairy!.name;
      location = getDairy!.location;
      date = getDairy!.date;
      dairy = getDairy!.dairy;
      pic = getDairy!.pic;
    }
    PlatformFile? file;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  (file == null)
                      ? Image.asset(
                          'assets/mountain.jpg',
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(file.path.toString()),
                          height: 100,
                          width: double.infinity,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white30, shape: BoxShape.circle),
                        // color: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white30, shape: BoxShape.circle),
                        // color: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          iconSize: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              dairy,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
