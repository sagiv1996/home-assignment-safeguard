import 'package:latlong2/latlong.dart';
import 'package:safeguard_home_assignment/providers/base_provider.dart';
import 'package:safeguard_home_assignment/providers/interfaces/map_provider_interface.dart';

const LatLng telAvivLatLng = LatLng(32.109333, 34.855499);

class MapProvider extends BaseProvider implements MapProviderInterface {
  LatLng _latLng = telAvivLatLng;

  @override
  LatLng get latLng => _latLng;

  @override
  void setLatLng(LatLng latLng) {
    _latLng = latLng;
  }
}
