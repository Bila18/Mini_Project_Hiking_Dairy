import 'package:flutter/foundation.dart';
import 'package:hiking_dairy/models/dairy.dart';

class DairyProvider with ChangeNotifier {
  final List<Dairy> _dairy = [];

  List<Dairy> get dairy => [..._dairy];

  void addDairy(Dairy newDairy) {
    _dairy.add(newDairy);
    notifyListeners();
  }

  void editDairy(Dairy changeDairy) {
    final dairyIndex = _dairy.indexWhere((dairy) => dairy.id == changeDairy.id);
    if (dairyIndex != -1) {
      _dairy[dairyIndex] = changeDairy;
      notifyListeners();
    }
  }

  void deletDairy(String id) {
    final dairyIndex = _dairy.indexWhere((dairy) => dairy.id == id);
    if (dairyIndex != -1) {
      _dairy.removeAt(dairyIndex);
      notifyListeners();
    }
  }
}
