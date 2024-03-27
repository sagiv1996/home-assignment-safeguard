import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/weather_static_data_provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_animation/weather_animation.dart';

class StaticWeatherPage extends StatelessWidget {
  const StaticWeatherPage({Key? key}) : super(key: key);
  WeatherScene _getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return WeatherScene.rainyOvercast;
      case > 300 && <= 600:
        return WeatherScene.stormy;
      case > 600 && <= 700:
        return WeatherScene.showerSleet;
      case > 700 && <= 800:
        return WeatherScene.sunset;
    }
    return WeatherScene.frosty;
  }

  @override
  Widget build(BuildContext context) {
    WeatherStaticDataProvider weatherData = context.watch<WeatherStaticDataProvider>();
    WeatherScene backgroundAnimation = weatherData.getWeatherIcon(0);
    Weather weather = weatherData.weather!;

    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: WeatherSceneWidget(
            weatherScene: backgroundAnimation,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.tealAccent,
                ),
                Text(
                  "${weather.areaName}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Text(
              "${weather.temperature?.celsius?.round()} °C",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            Text(
              "Feels like ${weather.tempFeelsLike?.celsius?.round()} °C",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              "${weather.weatherMain?.toUpperCase()}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
            ),
            Text(
              DateFormat("EE dd - HH:mm").format(weather.date!),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w300),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //     onPressed: () => context
                //         .read<WeatherProvider>()
                //         .fetchWeatherByCurrentPosition(),
                //     icon: const Icon(
                //       Icons.location_searching,
                //       color: Colors.white,
                //     )),
                // TextButton.icon(
                //     onPressed: () {
                //       context.read<MapProvider>().setLatLng(
                //           LatLng(weather.latitude!, weather.longitude!));
                //       context.push("/search");
                //     },
                //     icon: const Icon(
                //       Icons.search,
                //       color: Colors.white,
                //     ),
                //     label: const Text(
                //       "Change location",
                //       style: TextStyle(
                //           color: Colors.white, fontWeight: FontWeight.w500),
                //     )),
                // TextButton(
                //   onPressed: () => context.push('/static'),
                //   child: Text("See const data"),
                // ),
              ],
            ),
          ],
        )
        // const HomePageFooter(),
      ],
    ));
  }
}
