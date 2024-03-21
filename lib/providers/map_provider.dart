import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapProvider extends ChangeNotifier {
  bool isLoading = false;
  Position? position;
  MapProvider();

  getPosition() async {
    isLoading = true;
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    this.position = position;
    isLoading = false;
    notifyListeners();
  }
}
