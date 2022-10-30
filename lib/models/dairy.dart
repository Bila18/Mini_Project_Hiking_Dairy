import 'package:nanoid/non_secure.dart';

class Dairy {
  late String id;
  String name;
  String location;
  String date;
  String dairy;
  String pic;

  Dairy({
    required this.name,
    required this.location,
    required this.date,
    required this.dairy,
    required this.pic,
  }) {
    id = nanoid(20);
  }
}
