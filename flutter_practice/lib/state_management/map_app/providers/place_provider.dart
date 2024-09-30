import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/place.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);

  final String apiKey = dotenv.env['googleMapsApiKey']!;

  // 장소 검색 메서드
  Future<void> searchPlaces(String query) async {

    // final String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';
    // 지역 제한
    final String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&components=country:kr&key=$apiKey';

    if (query.isEmpty) {
      state = [];
      return;
    }

    final response = await http.get(Uri.parse(url));
    print('API response status: ${response.statusCode}'); // 응답 상태 로그

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API response data: $data'); // 응답 데이터 로그
      state =
          (data['predictions'] as List).map((place) => Place.fromJson(place))
              .toList();


      print('============== $state =======================');
    } else {
      throw Exception('Failed to load places');
    }
  }

  // 장소 상세정보 조회 메서드
  Future<Place> fetchPlaceDetails(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final placeData = data['result'];
      return Place.fromJson(placeData); // 상세정보를 Place 객체로 변환하여 반환
    } else {
      throw Exception('Failed to load place details');
    }
  }
}

// provier
final placeProvider = StateNotifierProvider<PlaceNotifier, List<Place>>((ref) {
  return PlaceNotifier();
});