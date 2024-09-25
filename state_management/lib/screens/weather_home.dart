import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/weather_provider.dart';
import 'city_search_screen.dart';
import '../models/weather.dart';

class WeatherHome extends ConsumerStatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends ConsumerState<WeatherHome> {
  List<Map<String, String>> cities = []; // 도시 리스트를 저장할 변수

  @override
  void initState() {
    super.initState();
    _loadCities(); // 앱 시작 시 도시 리스트 불러오기
  }

  Future<void> _loadCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cityList = prefs.getStringList('cities');

    if (cityList != null) {
      setState(() {
        cities = cityList.map((city) => {'display': city, 'api': city}).toList();
      });
      // 도시 리스트를 불러온 후 날씨 정보 요청
      ref.read(weatherProvider.notifier).cities = cityList; // 도시 리스트 업데이트

      await ref.read(weatherProvider.notifier).fetchWeather(); // 날씨 정보 가져오기
    }
  }

  Future<void> _saveCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cityList = cities.map((city) => city['display']!).toList();
    prefs.setStringList('cities', cityList);
  }

  void _addCity(String cityName) {
    setState(() {
      cities.add({'display': cityName, 'api': cityName}); // 도시 정보를 추가
    });
    _saveCities(); // 도시 리스트 저장
    ref.read(weatherProvider.notifier).addCity(cityName); // 날씨 정보 업데이트
  }

  void _removeCity(int index) {
    final cityName = cities[index]['api']!; // 삭제할 도시 이름 가져오기
    setState(() {
      cities.removeAt(index); // 리스트에서 도시 삭제
    });
    _saveCities(); // 도시 리스트 저장

    // 날씨 정보 업데이트 로직 추가
    ref.read(weatherProvider.notifier).removeCity(cityName); // 도시 이름을 전달
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsyncValue = ref.watch(weatherProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: const Text(
            '오늘의 날씨 정보',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final selectedCity = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CitySearchScreen()),
              );

              if (selectedCity != null) {
                _addCity(selectedCity);
              }
            },
          ),
        ],
      ),
      body: weatherAsyncValue.when(
        data: (weatherList) {
          return ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              final weather = weatherList.firstWhere(
                    (weather) => weather.cityName == city['api'],
                orElse: () => Weather(
                  cityName: city['api']!,
                  weatherIcon: 'default_icon',
                  weatherDescription: '',
                  maxTemp: 0,
                  minTemp: 0,
                  currentTemp: 0,
                  humidity: 0,
                  windSpeed: 0,
                ),
              );

              return Dismissible(
                key: Key(city['display']!),
                background: Container(color: Colors.red, child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('삭제 됩니다.', style: TextStyle(color: Colors.white, fontSize: 20),),
                    )),),
                onDismissed: (direction) {
                  _removeCity(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${city['display']} 도시가 삭제되었습니다.')),
                  );
                },
                child: Card(
                  color: Color(0xffEEF6FC),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffADDDFF),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Image.network(
                        'https://openweathermap.org/img/wn/${weather.weatherIcon}.png',
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // 이미지가 로드되면 그대로 반환
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            ); // 로딩 중일 때 스피너 표시
                          }
                        },
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Icon(Icons.error); // 오류 발생 시 오류 아이콘 표시
                        },
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          city['display'] ?? '',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        SizedBox(width: 10,),
                        Text('${weather.weatherDescription}',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '최고 기온: ${weather.maxTemp}°C',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '최저 기온: ${weather.minTemp}°C',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '현재 온도: ${weather.currentTemp}°C',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '습도: ${weather.humidity}%',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('오류 발생: $error')),
      ),
    );
  }
}