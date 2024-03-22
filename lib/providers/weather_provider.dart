import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_KEY']!;
WeatherFactory wf = WeatherFactory(apiKey);

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  Weather? weather;
  bool hasError = false;
  WeatherProvider();

  Future<void> initData() async {
    isLoading = true;
    if (weather != null) return;
    await fetchWeatherByCurrentPosition();
  }

  Future<void> fetchWeatherByCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      await fetchWeatherByLatLng(position.latitude, position.longitude);
    } catch (e) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLatLng(double latitude, double longitude) async {
    try {
      isLoading = true;
      Weather weather = await wf.currentWeatherByLocation(latitude, longitude);
      this.weather = weather;
    } catch (error) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
