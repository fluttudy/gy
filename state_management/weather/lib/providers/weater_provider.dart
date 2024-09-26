import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather.dart';

class WeatherNotifier extends StateNotifier<List<Weather>> {
  WeatherNotifier() : super([]);
  
}

final weatherProvider = StateNotifierProvider<WeatherNotifier, List<Weather>>((ref) {
  return WeatherNotifier();
});