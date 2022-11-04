import 'package:flutter/foundation.dart';
import 'package:hiking_dairy/models/mountain.dart';
import 'package:hiking_dairy/viewModels/rest_api/mountain_api.dart';

class MountainProvider with ChangeNotifier {
  late MountainApi _service;
  List<Mountain> _items = [];

  MountainProvider() {
    _service = MountainApi();
    _fetchDataMountains();
  }

  void _fetchDataMountains() async {
    _items = await _service.getAllMountains();
  }

  List<Mountain> get items {
    var temp = [..._items];
    temp.sort(
      (a, b) => a.nama.compareTo(b.nama),
    );
    return temp;
  }
}
