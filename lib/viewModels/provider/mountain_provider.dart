import 'package:flutter/foundation.dart';
import 'package:hiking_dairy/models/mountain.dart';
import 'package:hiking_dairy/viewModels/rest_api/mountain_api.dart';

enum MountainViewState {
  none,
  loading,
  error,
}

class MountainProvider with ChangeNotifier {
  late MountainApi _service;
  MountainViewState _state = MountainViewState.none;
  List<Mountain> _items = [];

  MountainProvider() {
    _service = MountainApi();
    _fetchDataMountains();
  }

  MountainViewState get state => _state;

  changeState(MountainViewState s) {
    _state = s;
    notifyListeners();
  }

  void _fetchDataMountains() async {
    changeState(MountainViewState.loading);
    try {
      _items = await _service.getAllMountains();
      changeState(MountainViewState.none);
    } catch (error) {
      changeState(MountainViewState.error);
    }
  }

  List<Mountain> get items {
    var temp = [..._items];
    temp.sort(
      (a, b) => a.nama.compareTo(b.nama),
    );
    return temp;
  }
}
