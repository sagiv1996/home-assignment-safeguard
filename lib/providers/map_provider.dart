import 'package:latlong2/latlong.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';

const LatLng telAvivLatLng = LatLng(32.109333, 34.855499);

class MapProvider extends BaseProvider {
  LatLng _latLng = telAvivLatLng;

  LatLng get latLng => _latLng;

  void setLatLng(LatLng latLng) {
    _latLng = latLng;
  }
}
