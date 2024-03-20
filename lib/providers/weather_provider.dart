import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  Weather? weather;
  WeatherProvider();

  Future<void> fetchWeather() async {
    try {
      isLoading = true;
      String apiKey = dotenv.env['API_KEY']!;
      WeatherFactory wf = WeatherFactory(apiKey);
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      Weather weather = await wf.currentWeatherByLocation(
          position.latitude, position.longitude);
      this.weather = weather;
    } catch (e) {
      print("e $e");
      print("ERROR!");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
