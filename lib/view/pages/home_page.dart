import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/error_provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_factory_provider.dart';
import 'package:safeguard_home_assignment/view/components/error_page.dart';
import 'package:safeguard_home_assignment/view/components/home_page_body.dart';
import 'package:safeguard_home_assignment/view/components/home_page_footer.dart';
import 'package:safeguard_home_assignment/view/components/loading_page.dart';
import 'package:weather/weather.dart';
import 'package:weather_animation/weather_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = context.watch<WeatherProvider>();
    bool isLoading = weatherProvider.isLoading;
    bool hasError = weatherProvider.hasError;
    if (isLoading) return const LoadingPage();
    if (hasError) {
      context.read<ErrorProvider>().setData();
      return const ErrorPage();
    }
    Weather weather = weatherProvider.weather!;
    WeatherScene backgroundAnimation =
        weatherProvider.getWeatherIcon(weather.weatherConditionCode!);
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
        HomePageBody(weather: weather, actions: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => context
                      .read<WeatherProvider>()
                      .fetchWeatherByCurrentPosition(),
                  icon: const Icon(
                    Icons.location_searching,
                    color: Colors.white,
                  )),
              TextButton.icon(
                  onPressed: () {
                    context.read<MapProvider>().setLatLng(
                        LatLng(weather.latitude!, weather.longitude!));
                    context.push("/search");
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Change location",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )),
              TextButton(
                onPressed: () => context.push('/static'),
                child: const Text(
                  "Constant values",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),),
        HomePageFooter(weather: weather),
      ],
    ));
  }
}
