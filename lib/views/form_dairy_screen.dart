import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hiking_dairy/models/dairy.dart';
import 'package:hiking_dairy/viewModels/provider/dairy_provider.dart';
import 'package:hiking_dairy/views/bottom_nav_bar.dart';
import 'package:hiking_dairy/views/home_screen.dart';
import 'package:hiking_dairy/views/information_screen.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

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
  final _ctrlPic = MaterialStatesController();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  //Date Picker
  final curentDate = DateTime.now();

  //File_Picker
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    // Mendapatkan file yang telah di pick
    final file = result.files.first;
  }

  Dairy? editdairy;

  void validateInput() {
    formKey.currentState!.save();
    final newDairy = Dairy(
      name: _ctrlName.text,
      location: _ctrlLocation.text,
      date: _ctrlDate.text,
      dairy: _ctrlDairy.text,
      pic: _ctrlPic.toString(),
    );
    if (editdairy != null) {
      newDairy.id = editdairy!.id;
      Provider.of<DairyProvider>(context, listen: false).editDairy(newDairy);
    } else {
      Provider.of<DairyProvider>(context, listen: false).addDairy(newDairy);
    }
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dairy berhasil disimpan'),
        ),
      );
      //Navigator.pop(context);
      Navigator.of(context).pushNamed(BottomNavBar.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    editdairy = ModalRoute.of(context)!.settings.arguments as Dairy?;
    if (editdairy != null) {
      _ctrlName.text = editdairy!.name;
      _ctrlLocation.text = editdairy!.location;
      _ctrlDate.text = editdairy!.date;
      _ctrlDairy.text = editdairy!.dairy;
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
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
                  TextFormField(
                    controller: _ctrlName,
                    decoration: const InputDecoration(
                      hintText: 'Mountain Rinjani',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please input mountain name';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      if (newValue != null) _ctrlName.text = newValue;
                    }),
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
                  TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please input location';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      if (newValue != null) _ctrlLocation.text = newValue;
                    }),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please input date';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      if (newValue != null) _ctrlDate.text = newValue;
                    }),
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
                  TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please input your dairy';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      if (newValue != null) _ctrlDairy.text = newValue;
                    }),
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
                    statesController: _ctrlPic,
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: const Color.fromARGB(255, 93, 70, 41),
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
                          backgroundColor:
                              const Color.fromARGB(255, 93, 70, 41),
                        ),
                        onPressed: () {
                          validateInput();
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
