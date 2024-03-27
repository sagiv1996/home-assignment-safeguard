import 'package:geolocator/geolocator.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';
import 'package:safeguard_home_assignment/providers/interfaces/error_provider_interface.dart';

class ErrorProvider extends BaseProvider implements ErrorProviderInterface {
  ErrorProvider() {
    setData();
  }

  bool _serviceEnabled = false;
  LocationPermission? _permission;

  @override
  bool get serviceEnabled => _serviceEnabled;

  @override
  LocationPermission? get permission => _permission;

  @override
  void setServiceEnabled(bool serviceEnabled) {
    _serviceEnabled = serviceEnabled;
  }

  @override
  void setPermission(LocationPermission permission) {
    _permission = permission;
  }

  Future<void> setData() async {
    setIsLoading(true);
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    setServiceEnabled(serviceEnabled);
    LocationPermission permission = await Geolocator.checkPermission();
    setPermission(permission);
    setIsLoading(false);
    notifyListeners();
  }
}
