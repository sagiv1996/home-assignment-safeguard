import 'package:latlong2/latlong.dart';
import 'package:safeguard_home_assignment/providers/interfaces/base_provider_interface.dart';

abstract class MapProviderInterface extends BaseProviderInterface {
  LatLng get latLng;
  void setLatLng(LatLng latLng);
}