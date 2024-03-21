import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_KEY']!;
WeatherFactory wf = WeatherFactory(apiKey);

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  Weather? weather;
  WeatherProvider();

  Future<void> initData() async {
    isLoading = true;
    if (weather != null) return;
    await fetchWeatherByCurrentPosition();
  }

  Future<void> fetchWeatherByCurrentPosition() async {
    isLoading = true;
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    await fetchWeatherByLatLng(position.latitude, position.longitude);
  }

  Future<void> fetchWeatherByLatLng(double latitude, double longitude) async {
    try {
      isLoading = true;
      Weather weather = await wf.currentWeatherByLocation(latitude, longitude);
      this.weather = weather;
    } catch (error) {
      print("Error! ${error}");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
