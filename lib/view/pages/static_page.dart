import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_static_data_provider.dart';
import 'package:safeguard_home_assignment/view/components/home_page_body.dart';
import 'package:safeguard_home_assignment/view/components/home_page_footer.dart';
import 'package:weather/weather.dart';
import 'package:weather_animation/weather_animation.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({Key? key}) : super(key: key);

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
        HomePageBody(
          weather: weather,
          actions: Row(
            children: [
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
            ],
          ),
        ),
        HomePageFooter(weather: weather)
      ],
    ));
  }
}
