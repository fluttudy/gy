import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final List<String> cities = [
  'seoul',
  'incheon',
  'daegu',
  'daejeon',
  'busan',
  'gwangju',
  "ulsan",
  'jeju'
];

// notifer
class WeatherNotifier extends StateNotifier<List<Weather>> {
  // 초기 상태 기본 도시 불러오기
  // weatherNotifier의 state는 weather객체들을 가지는 List
  WeatherNotifier() : super([]) {
    Future.microtask(() => setDefaultCities());
  }

  // 날씨 데이터를 가져와서, 기존 리스트에 넣는 비동기 함수 fetchWeather
  Future<void> fetchWeather(String cityName) async {
    final apiKey = dotenv.get('openWeatherApiKey');
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Weather weather = Weather.fromJson(data);
      state = [...state, weather];
    }
  }

  // 기본 도시들 추가 함수
  Future<void> setDefaultCities() async {
    for (String cityName in cities) {
      await fetchWeather(cityName);
    }
    state = [...state];
  }

  // 도시 추가
  void addCity(Weather weather) {
    state = [
      weather,
      ...state,
    ];
  }

  // 도시 제거
  void removeCity(int index) {
    state = [...state]..removeAt(index); // 해당 인덱스의 날씨 정보 제거
  }

  // 즐겨찾기 토글
  void toggleFavorite(int index) {
    state = state.map((weather) {
      if (weather == state[index]) {
        return Weather(
          cityName: weather.cityName,
          currentTemp: weather.currentTemp,
          isFavorite: !weather.isFavorite,
          // 즐겨찾기 상태 토글
          iconId: weather.iconId,
          // 필수 인자 포함
          weatherDescription: weather.weatherDescription,
          // 필수 인자 포함
          maxTemp: weather.maxTemp,
          // 필수 인자 포함
          minTemp: weather.minTemp,
          // 필수 인자 포함
          humidity: weather.humidity,
          // 필수 인자 포함
          windSpeed: weather.windSpeed, // 필수 인자 포함
        );
      }
      return weather; // 다른 아이템은 그대로 유지
    }).toList();

    // 즐겨찾기 아이템을 리스트 상단으로 이동
    state.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) {
        return -1;
      } else if (!a.isFavorite && b.isFavorite) {
        return 1;
      }
      return 0;
    });
  }
}

// provier
final weatherProvider = StateNotifierProvider<WeatherNotifier, List<Weather>>((ref) {
  return WeatherNotifier();
});