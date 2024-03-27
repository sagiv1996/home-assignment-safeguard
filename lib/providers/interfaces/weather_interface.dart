import 'package:safeguard_home_assignment/providers/interfaces/base_provider_interface.dart';
import 'package:weather/weather.dart';
import 'package:weather_animation/weather_animation.dart';

abstract class WeatherInterface extends BaseProviderInterface {
  Weather? get weather;
  void setWeather(Weather weather);
  WeatherScene getWeatherIcon(int code);
}
