import 'package:geolocator/geolocator.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';

class ErrorProvider extends BaseProvider {
  ErrorProvider() {
    setData();
  }

  bool _serviceEnabled = false;
  LocationPermission? _permission;

  bool get serviceEnabled => _serviceEnabled;
  LocationPermission? get permission => _permission;

  void setServiceEnabled(bool serviceEnabled) {
    _serviceEnabled = serviceEnabled;
  }

  void setPermission(LocationPermission permission) {
    _permission = permission;
  }

  Future<void> setData() async {
    setLoading(true);
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    setServiceEnabled(serviceEnabled);
    LocationPermission permission = await Geolocator.checkPermission();
    setPermission(permission);
    setLoading(false);
    notifyListeners();
  }
}
