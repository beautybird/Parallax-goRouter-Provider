import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myandroidapp/src/map/map_models/place_name_search.dart';

class MarkerService {
  LatLngBounds? bounds(List<Marker>? markers) {
    if (markers == null || markers.isEmpty) return null;
    return createBounds(markers.map((m) => m.position).toList());
  }

  LatLngBounds createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  Marker createMarkerFromPlace(PlaceName place, bool center) {
    var markerId = place.name;
    if (center) markerId = 'center';

    return Marker(
        markerId: MarkerId(markerId!),
        draggable: false,
        visible: (center) ? false : true,
        infoWindow: InfoWindow(title: place.name),
        position: LatLng(place.geometrySearch!.locationSearch!.lat!,
            place.geometrySearch!.locationSearch!.lng!));
  }
}
