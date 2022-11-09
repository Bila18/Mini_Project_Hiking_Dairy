import 'package:hiking_dairy/models/mountain.dart';
import 'package:hiking_dairy/viewModels/rest_api/mountain_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import './mountain_api_test.mocks.dart';

@GenerateMocks([MountainApi])
void main() {
  MountainApi mountainApi = MockMountainApi();
  test('Get all mountains', () async {
    when(mountainApi.getAllMountains()).thenAnswer((_) async => <Mountain>[
          Mountain(
              nama: 'Rinjani',
              bentuk: 'startovulkan',
              tinggiMeter: '1030 meter',
              estimasiLetusanTerakhir: 'N/A',
              geolokasi: '34.0S 147.3L')
        ]);
    var mountains = await mountainApi.getAllMountains();
    expect(mountains.isNotEmpty, true);
  });
}
