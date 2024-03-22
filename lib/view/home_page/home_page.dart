import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/error_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_provider.dart';
import 'package:safeguard_home_assignment/view/error_page.dart';
import 'package:safeguard_home_assignment/view/home_page/home_page_body.dart';
import 'package:safeguard_home_assignment/view/home_page/home_page_footer.dart';
import 'package:safeguard_home_assignment/view/page_loading.dart';
import 'package:weather/weather.dart';
import 'package:weather_animation/weather_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    WeatherProvider weatherProvider = context.watch<WeatherProvider>();
    bool isLoading = weatherProvider.isLoading;
    bool hasError = weatherProvider.hasError;
    if (isLoading) return const PageLoading();
    if (hasError) {
      context.read<ErrorProvider>().setData();
      return const ErrorPage();
    }
    Weather weather = weatherProvider.weather!;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: WeatherSceneWidget(
            weatherScene: _getWeatherIcon(weather.weatherConditionCode!),
          ),
        ),
        const HomePageBody(),
        const HomePageFooter(),
      ],
    ));
  }
}
