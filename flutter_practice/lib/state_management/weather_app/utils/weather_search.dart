import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../providers/weather_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherSearch extends SearchDelegate<Weather?> {
  final WeatherNotifier notifier;
  WeatherSearch({required this.notifier});

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () => query.isEmpty ? close(context, null) : query = '',
    ),
  ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Weather>>(
      future: fetchWeather(query),  // 여기서 query는 사용자가 입력한 도시명
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('검색 결과가 없습니다.'),
          );
        } else {
          final weathers = snapshot.data!;
          return ListView.builder(
            itemCount: weathers.length,
            itemBuilder: (context, index) {
              final weather = weathers[index];
              return ListTile(
                title: Text(weather.cityName),
                subtitle:
                Text("현재: ${weather.currentTemp.toStringAsFixed(0)}°C"),
                trailing: TextButton(
                  onPressed: () {
                      notifier.addCity(weather);
                      close(context, null);
                  },
                  child: Text('추가하기'),
                ),
                onTap: null,
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Text('도시 이름을 입력하세요.'),
    );
  }

  // 검색 창에 검색 결과를 보여주기 위한 비동기 함수
  Future<List<Weather>> fetchWeather(String query) async {
    final apiKey = dotenv.get('openWeatherApiKey');
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final weather = Weather.fromJson(json);
      return [weather]; // 날씨 정보를 리스트 형태로 반환
    } else {
      return [];
    }
  }

}