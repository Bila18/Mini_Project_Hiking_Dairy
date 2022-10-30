import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hiking_dairy/views/bottom_nav_bar.dart';
import 'package:hiking_dairy/views/home_screen.dart';
import 'package:hiking_dairy/views/information_screen.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class FormDairy extends StatefulWidget {
  static const routeName = '/Form';
  const FormDairy({super.key});

  @override
  State<FormDairy> createState() => _FormDairyState();
}

class _FormDairyState extends State<FormDairy> {
  final formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlLocation = TextEditingController();
  final _ctrlDairy = TextEditingController();
  final _ctrlDate = TextEditingController();
  final _ctrlPic = TextEditingController();

  //Date Picker
  final curentDate = DateTime.now();

  //File_Picker
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // Mendapatkan file yang telah di pick
    final file = result.files.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Mountain Name :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _ctrlName,
                    decoration: const InputDecoration(
                      hintText: 'Gunung Rinjani',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Location :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _ctrlLocation,
                    decoration: const InputDecoration(
                      hintText: 'Lombok, Nusa Tenggara Barat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Date :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _ctrlDate,
                    decoration: const InputDecoration(
                      hintText: 'dd/mm/yyyy',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: curentDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(curentDate.year + 5),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _ctrlDate.text =
                              DateFormat('EEE, M/d/y').format(selectedDate);
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Dairy :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 10,
                    controller: _ctrlDairy,
                    decoration: const InputDecoration(
                      hintText:
                          "Rinjani is the most beautiful mountain i've ever visited",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Picture :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Color.fromARGB(255, 93, 70, 41),
                    ),
                    onPressed: () async {
                      _pickFile();
                    },
                    child: const Text('Pick File'),
                  ),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: Color.fromARGB(255, 93, 70, 41),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(BottomNavBar.routeName);
                        },
                        child: const Text('Submit')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
