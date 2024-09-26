class Weather {
  final String cityName;
  final String weatherDescription;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double windSpeed;
  final bool isFavorite;

  Weather({
    required this.cityName,
    required this.weatherDescription,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.windSpeed,
    this.isFavorite = false,
  });
}
