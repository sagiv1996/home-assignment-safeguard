import 'package:safeguard_home_assignment/providers/base_provider.dart';
import 'package:safeguard_home_assignment/providers/interfaces/weather_interface.dart';
import 'package:weather/weather.dart';
import 'package:weather_animation/src/model/scenes.dart';

class WeatherStaticData extends BaseProvider implements WeatherInterface {
  WeatherStaticData() {
    Weather weather = Weather({
      "coord": {"lon": 35.1983, "lat": 31.7602},
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "base": "stations",
      "main": {
        "temp": 296.39,
        "feels_like": 295.63,
        "temp_min": 295.67,
        "temp_max": 296.81,
        "pressure": 1015,
        "humidity": 33
      },
      "visibility": 10000,
      "wind": {"speed": 0.45, "deg": 123, "gust": 1.79},
      "clouds": {"all": 83},
      "dt": 1711551650,
      "sys": {
        "type": 2,
        "id": 2004982,
        "country": "IL",
        "sunrise": 1711510423,
        "sunset": 1711554904
      },
      "timezone": 7200,
      "id": 294990,
      "name": "Tel Aviv",
      "cod": 200
    });
    setWeather(weather);
  }
  Weather? _weather;

  @override
  Weather? get weather => _weather;

  @override
  void setWeather(Weather weather) {
    _weather = weather;
  }

  @override
  WeatherScene getWeatherIcon(int code) {
    return WeatherScene.sunset;
  }
}
