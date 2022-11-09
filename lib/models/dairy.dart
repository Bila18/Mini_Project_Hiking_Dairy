import 'package:nanoid/non_secure.dart';

class Dairy {
  late String id;
  late String name;
  late String location;
  late String date;
  late String dairy;
  late String pic;

  Dairy({
    required this.name,
    required this.location,
    required this.date,
    required this.dairy,
    required this.pic,
  }) {
    id = nanoid(20);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'date': date,
      'dairy': dairy,
      'pic': pic,
    };
  }

  Dairy.fromMap(Map<String, dynamic> map) {
    id = map['id'].toString();
    name = map['name'].toString();
    location = map['location'].toString();
    date = map['date'].toString();
    dairy = map['dairy'].toString();
    pic = map['pic'].toString();
  }
}
