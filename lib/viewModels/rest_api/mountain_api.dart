import 'package:dio/dio.dart';
import 'package:hiking_dairy/models/mountain.dart';

class MountainApi {
  late Dio _dio;
  static const url =
      'https://indonesia-public-static-api.vercel.app/api/volcanoes';

  MountainApi() {
    _dio = Dio();
  }

  Future<List<Mountain>> getAllMountains() async {
    final response = await _dio.get(url);
    if (response.data != null) {
      return List<Mountain>.from(response.data
          .map((mountain) => Mountain.fromJson(mountain))
          .toList());
    }
    return [];
  }
}
