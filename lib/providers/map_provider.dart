import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';

class MapProvider extends BaseProvider {
  Position? _position;

  Position? get position => _position;

  void setPosition(Position position) {
    _position = position;
  }

  getPosition() async {
    setLoading(true);
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    setPosition(position);
    setLoading(false);
    notifyListeners();
  }
}
