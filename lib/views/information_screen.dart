import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hiking_dairy/models/widget/mountain_item.dart';
import 'package:hiking_dairy/viewModels/provider/mountain_provider.dart';
import 'package:hiking_dairy/viewModels/rest_api/mountain_api.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';
import 'package:hiking_dairy/views/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class Information extends StatefulWidget {
  static const routeName = '/Info';
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    final mountains = Provider.of<MountainProvider>(context).items;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MountainItem(mountain: mountains[index]);
          },
          itemCount: mountains.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
