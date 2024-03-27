import 'package:geolocator/geolocator.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';
import 'package:safeguard_home_assignment/providers/interfaces/weather_interface.dart';
import 'package:weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_KEY']!;
WeatherFactory wf = WeatherFactory(apiKey);

class WeatherProvider extends BaseProvider implements WeatherInterface {
  WeatherProvider() {
    if (weather != null) return;
    fetchWeatherByCurrentPosition();
  }
  Weather? _weather;

  @override
  Weather? get weather => _weather;

  @override
  void setWeather(Weather weather) {
    _weather = weather;
  }

  Future<void> fetchWeatherByCurrentPosition() async {
    try {
      setHasError(false);
      setIsLoading(true);
      notifyListeners();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      await fetchWeatherByLatLng(position.latitude, position.longitude);
    } catch (e) {
      setHasError(true);
    } finally {
      setIsLoading(false);
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLatLng(double latitude, double longitude) async {
    try {
      setHasError(false);
      setIsLoading(true);
      notifyListeners();
      Weather weather = await wf.currentWeatherByLocation(latitude, longitude);
      setWeather(weather);
    } catch (error) {
      setHasError(true);
    } finally {
      setIsLoading(false);
      notifyListeners();
    }
  }
}
