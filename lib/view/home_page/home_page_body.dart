import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_provider.dart';
import 'package:weather/weather.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Weather weather = context.watch<WeatherProvider>().weather!;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Text(
            "Feels like ${weather.tempFeelsLike?.celsius?.round()} °C",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "${weather.weatherMain?.toUpperCase()}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24),
          ),
          Text(
            DateFormat("EE dd - HH:mm").format(weather.date!),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Row(
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
                    context.read<MapProvider>().getPosition();
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
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
