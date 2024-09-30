class Weather {
  final String iconId;
  final String cityName;
  final String weatherDescription;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double windSpeed;
  bool isFavorite;

  Weather({
    required this.iconId,
    required this.cityName,
    required this.weatherDescription,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.windSpeed,
    this.isFavorite = false,
  });

  // 팩토리 메서드: Weather.fromJson 메서드는 JSON 데이터를 입력받아 Weather 객체를 생성. 객체 생성을 위임함.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      iconId: json['weather'][0]['icon'],
      cityName: json['name'], // 도시 이름
      weatherDescription: json['weather'][0]['description'], // 날씨 설명
      currentTemp: json['main']['temp'].toDouble(), // 현재 온도
      maxTemp: json['main']['temp_max'].toDouble(), // 최대 온도
      minTemp: json['main']['temp_min'].toDouble(), // 최소 온도
      humidity: json['main']['humidity'], // 습도
      windSpeed: json['wind']['speed'].toDouble(),
      isFavorite: json['isFavorite'] ?? false,
      // isFavorite는 기본값 false로 설정되므로 명시적으로 지정할 필요 없음
    );
  }
}
