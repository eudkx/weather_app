import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/service/weather_service.dart';

import '../model/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weatherServices = WeatherService('1083ac7917f0494b19c5f0da59e21782');
  Weather? _weather;

  _fetchWeather() async {
    String cityname = await _weatherServices.getCurrentCity();

    try {
      final weather = await _weatherServices.getWeather(cityname);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(_weather?.cityName ?? "loading city..."),
          Text('${_weather?.temperature.round()}°C')
        ],
      ),
    );
  }
}
