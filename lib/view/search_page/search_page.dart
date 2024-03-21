import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/weather_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MapController _mapController = new MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            onTap: (tapPosition, point) {
              context
                  .read<WeatherProvider>()
                  .fetchWeatherByLatLng(point.latitude, point.longitudeInRad);
              context.push("/");
            },
            initialCenter: LatLng(0, 0),
            initialZoom: 1,
            minZoom: 0,
            maxZoom: 19,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ]),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.location_searching,
          color: Colors.blue,
        ),
        onPressed: () async {
          Position position = await Geolocator.getCurrentPosition();
          _mapController.move(
              LatLng(position.latitude, position.longitude), 10);
        },
      ),
    );
  }
}
