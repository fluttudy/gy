import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/place.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);

  final String apiKey = dotenv.env['googleMapsApiKey']!;

  // 즐겨찾기 목록
  List<Place> favorites = [];

  void toggleFavorite(Place place) {
    // isFavorite 상태를 토글
    final updatedPlace = place.copyWith(isFavorite: !place.isFavorite);

    // 즐겨찾기 목록 업데이트
    if (updatedPlace.isFavorite) {
      favorites.add(updatedPlace);
    } else {
      favorites.removeWhere((p) => p.placeId == updatedPlace.placeId);
    }

    // 상태 업데이트: 새로운 리스트 생성
    state = state.map((p) {
      if (p.placeId == place.placeId) {
        return updatedPlace; // 업데이트된 Place 객체 반환
      }
      return p;
    }).toList();
  }

  // 장소 검색 메서드
  Future<void> searchPlaces(String query) async {
    if (query.isEmpty) {
      state = [];
      return;
    }

    final String apiKey = dotenv.env['googleMapsApiKey']!;
    final String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey&language=ko';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // predictions에서 각 장소의 ID를 가져오고, 해당 ID로 상세 정보를 가져옴
      final predictions = data['results'] as List;

      List<Place> places = [];

      for (var prediction in predictions) {
        // Place 객체 생성
        String placeId = prediction['place_id'];

        // 상세 정보를 가져오기 위해 fetchPlaceDetails 호출
        Place placeDetails = await fetchPlaceDetails(placeId);

        // Place 객체에 추가
        places.add(placeDetails);
      }

      state = places; // 전체 장소 정보를 state에 저장
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<Place> fetchPlaceDetails(String placeId) async {
    final String apiKey = dotenv.env['googleMapsApiKey']!;
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&language=ko&key=$apiKey';

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