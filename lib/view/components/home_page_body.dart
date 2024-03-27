import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_factory_provider.dart';
import 'package:weather/weather.dart';

class HomePageBody extends StatelessWidget {
  final Weather weather;
  final Row actions;
  const HomePageBody({super.key, required this.weather, required this.actions});

  @override
  Widget build(BuildContext context) {
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
          actions,
        ],
      ),
    );
  }
}
