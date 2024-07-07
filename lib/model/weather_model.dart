class Weather {
  final String cityName;
  final double temperature;
  final String finalCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.finalCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      finalCondition: json['weather'][0]['main'],
    );
  }
}
