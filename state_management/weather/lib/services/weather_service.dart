import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:weather/utils/network_helper.dart';

class WeatherService {
  final String _apiKey = dotenv.env['openWeatherApiKey']!;
  final String _baseUrl = dotenv.env['openWeatherApiBaseUrl']!;
  final Logger _logger = Logger(); // 로그 인스턴스 생성

  Future getWeather(String cityName) async {
    _logger.i('getWeather called with city: $cityName'); // 정보 로그 기록

    try {
      final weatherData = await NetworkHelper()
          .getData('$_baseUrl?q=$cityName&appid=$_apiKey&units=metric');
      return weatherData;
    } catch (e) {
      _logger.e('error: fetching weather data: ${e.toString()}'); // 오류 로그 기록
      return null;
    }
  }
}
