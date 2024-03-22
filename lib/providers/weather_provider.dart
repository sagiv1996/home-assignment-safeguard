import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';
import 'package:weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_KEY']!;
WeatherFactory wf = WeatherFactory(apiKey);

class WeatherProvider extends BaseProvider {
  Weather? _weather;

  Weather? get weather => _weather;

  void setWeather(Weather weather) {
    _weather = weather;
  }

  Future<void> initData() async {
    setLoading(true);
    if (weather != null) return;
    await fetchWeatherByCurrentPosition();
  }

  Future<void> fetchWeatherByCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      await fetchWeatherByLatLng(position.latitude, position.longitude);
    } catch (e) {
      setError(true);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLatLng(double latitude, double longitude) async {
    try {
      setLoading(true);
      Weather weather = await wf.currentWeatherByLocation(latitude, longitude);
      setWeather(weather);
    } catch (error) {
      setError(true);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
