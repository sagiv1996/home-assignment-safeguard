import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/error_provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_factory_provider.dart';
import 'package:safeguard_home_assignment/view/components/error_page.dart';
import 'package:safeguard_home_assignment/view/components/loading_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    MapProvider mapProvider = context.watch<MapProvider>();
    bool isLoading = mapProvider.isLoading;
    bool hasError = mapProvider.hasError;
    if (isLoading) return const LoadingPage();
    if (hasError) {
      context.read<ErrorProvider>().setData();
      return const ErrorPage();
    }
    LatLng latLng = mapProvider.latLng;
    return Scaffold(
        body: FlutterMap(
            options: MapOptions(
                onTap: (tapPosition, point) {
                  context
                      .read<WeatherProvider>()
                      .fetchWeatherByLatLng(point.latitude, point.longitude);
                  context.push("/");
                },
                initialCenter: latLng,
                initialZoom: 8),
            children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ]));
  }
}
