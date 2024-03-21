import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_provider.dart';
import 'package:safeguard_home_assignment/view/page_loading.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<MapProvider>().isLoading;
    if (isLoading) return const PageLoading();
    Position position = context.watch<MapProvider>().position!;
    return Scaffold(
        body: FlutterMap(
            options: MapOptions(
                onTap: (tapPosition, point) {
                  context
                      .read<WeatherProvider>()
                      .fetchWeatherByLatLng(point.latitude, point.longitude);
                  context.push("/");
                },
                initialCenter: LatLng(position.latitude, position.longitude),
                initialZoom: 8),
            children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ]));
  }
}
