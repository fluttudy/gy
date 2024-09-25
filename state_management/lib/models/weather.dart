class Weather {
  final String cityName;
  final String weatherIcon;
  final String weatherDescription;
  final double maxTemp;
  final double minTemp;
  final double currentTemp;
  final int humidity;
  final double windSpeed;
  final bool isFavorite;

  Weather({
    required this.cityName,
    required this.weatherIcon,
    required this.weatherDescription,
    required this.maxTemp,
    required this.minTemp,
    required this.currentTemp,
    required this.humidity,
    required this.windSpeed,
    this.isFavorite = false,
  });
}
