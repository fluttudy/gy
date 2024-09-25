import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather.dart';

class WeatherNotifier extends StateNotifier<AsyncValue<List<Weather>>> {
  WeatherNotifier() : super(AsyncValue.loading());

  final String apiKey = 'a0db626d7a4aceb088e90c8f01bc4ae1';
  List<String> cities = [];

  // removeCity 메서드 추가
  void removeCity(String cityName) {
    cities.remove(cityName);
    fetchWeather(); // 날씨 정보 업데이트
  }

  Future<void> fetchWeather() async {
    try {
      List<Weather> weatherList = [];
      for (String city in cities) {
        final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          weatherList.add(Weather(
            cityName: city,
            weatherIcon: data['weather'][0]['icon'],
            weatherDescription: data['weather'][0]['description'],
            maxTemp: (data['main']['temp_max'] as num).toDouble(),
            minTemp: (data['main']['temp_min'] as num).toDouble(),
            currentTemp: (data['main']['temp'] as num).toDouble(),
            humidity: data['main']['humidity'],
            windSpeed: (data['wind']['speed'] as num).toDouble(),
          ));
        }
      }
      state = AsyncValue.data(weatherList);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e.toString(), stackTrace);
    }
  }

  void addCity(String city) {
    cities.add(city);
    fetchWeather(); // 도시 추가 후 날씨 정보 새로 고침
  }
}

// Provider 정의
final weatherProvider = StateNotifierProvider<WeatherNotifier, AsyncValue<List<Weather>>>((ref) {
  return WeatherNotifier();
});