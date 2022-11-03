import 'package:flutter/material.dart';
import 'package:hiking_dairy/models/dairy.dart';
import 'package:hiking_dairy/viewModels/provider/dairy_provider.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';
import 'package:provider/provider.dart';

class DairyItem extends StatelessWidget {
  final Dairy dairy;
  const DairyItem(this.dairy, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
          //Detail Screen
          onTap: () {},
          //Edit Screen
          onDoubleTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Edit Dairy'),
                  content: Text(
                    'Are you sure want to edit this ${dairy.name} dairy?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await Navigator.of(context).pushNamed(
                          FormDairy.routeName,
                          arguments: dairy,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 250,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset.fromDirection(45),
                ),
              ],
              color: const Color.fromARGB(255, 237, 223, 179),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        dairy.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Delete Dairy'),
                                  content: Text(
                                    'Are you sure want to delet this ${dairy.name} dairy?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<DairyProvider>(context,
                                                  listen: false)
                                              .deletDairy(dairy.id);
                                        },
                                        child: const Text('Yes'))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        dairy.location,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        dairy.date,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    dairy.dairy,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
