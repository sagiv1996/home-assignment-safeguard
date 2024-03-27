import 'package:geolocator/geolocator.dart';
import 'package:safeguard_home_assignment/providers/interfaces/base_provider_interface.dart';

abstract class ErrorProviderInterface extends BaseProviderInterface {
  bool get serviceEnabled;
  LocationPermission? get permission;
  void setServiceEnabled(bool serviceEnabled);
  void setPermission(LocationPermission permission);
}
