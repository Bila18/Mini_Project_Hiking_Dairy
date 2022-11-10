import 'package:flutter/foundation.dart';
import 'package:hiking_dairy/models/dairy.dart';
import 'package:hiking_dairy/viewModels/database/database_helper.dart';

class DairyProvider with ChangeNotifier {
  List<Dairy> _dairy = [];
  late DatabaseHelper _dbHelper;

  List<Dairy> get dairy => List.unmodifiable(_dairy);

  DairyProvider() {
    _dbHelper = DatabaseHelper();
    _getAllDairy();
    notifyListeners();
  }

  Future<void> _getAllDairy() async {
    _dairy = await _dbHelper.getDairy();
    notifyListeners();
  }

  Future<void> addDairy(Dairy newDairy) async {
    await _dbHelper.insertDairy(newDairy);
    notifyListeners();
  }

  Future<Dairy> getTaskById(String id) async {
    return await _dbHelper.getDairyById(id);
  }

  Future<void> upadateTask(Dairy dairy) async {
    final isSuccess = await _dbHelper.updateDairy(dairy);
    if (isSuccess) _getAllDairy();
    notifyListeners();
  }

  Future<void> deleteDairy(String id) async {
    final isSuccess = await _dbHelper.deletDairy(id);
    if (isSuccess) _getAllDairy();
    notifyListeners();
  }
}
