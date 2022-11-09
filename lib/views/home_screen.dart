import 'package:flutter/material.dart';
import 'package:hiking_dairy/models/widget/dairy.item.dart';
import 'package:hiking_dairy/viewModels/provider/dairy_provider.dart';
import 'package:provider/provider.dart';
import '../models/widget/empty_dairy.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dataDairy = Provider.of<DairyProvider>(context).dairy;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "My Dairy",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                dataDairy.isEmpty
                    ? const EmptyDairy()
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final dairy = dataDairy.elementAt(index);
                          return DairyItem(dairy);
                        },
                        itemCount: dataDairy.length,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
