import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myandroidapp/src/map/map_models/place_name_search.dart';
import 'package:myandroidapp/src/map/map_models/place_search.dart';
import 'package:myandroidapp/src/map/map_services/marker_service.dart';
import 'package:myandroidapp/src/map/map_services/places_service.dart';

class MapProvider with ChangeNotifier{

  MapProvider();

  //Search Places...related to step 1 ... we get the data from PlacesService
  //to present to the UI..the searchResults is what will show in the UI
  // We have to notify the UI that new places available
  final placesService = PlacesService();

  List<PlaceSearch?>? searchResults;

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getSearchAutocomplete(searchTerm);
    notifyListeners();
  }

  //This with Step 2 ....passing this details to Passing the place details to the UI
  StreamController<PlaceName?>? selectedLocation =
  StreamController<PlaceName>();
  PlaceName? sLocation;
  PlaceName? selectedLocationStatic;

  setSelectedLocation(String placeId) async {
    sLocation = await placesService.getPlace(placeId);
    selectedLocation!.add(sLocation);
    selectedLocationStatic = sLocation;
    searchResults = null;
    notifyListeners();
  }

  StreamController<LatLngBounds?>? bounds = StreamController<LatLngBounds>();
  String? placeType;
  List<PlaceSearch?>? placeResults;
  List<Marker>? markers;
  List? places;
  Marker? newMarker;

  clearSelectedLocation() {
    selectedLocation!.add(null);
    selectedLocationStatic = null;
    searchResults = null;
    placeType = null;
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      placeType = null;
    }

    final markerService = MarkerService();

    if (placeType != null) {
      places = await placesService.getPlaces(
          selectedLocationStatic!.geometrySearch!.locationSearch!.lat!,
          selectedLocationStatic!.geometrySearch!.locationSearch!.lng!,
          placeType!);
      markers = [];
      if (places!.isNotEmpty == true) {
        newMarker = markerService.createMarkerFromPlace(places![0], false);
        markers!.add(newMarker!);
      }

      var locationMarker =
      markerService.createMarkerFromPlace(selectedLocationStatic!, true);
      markers!.add(locationMarker);

      var _bounds = markerService.bounds(markers);
      bounds!.add(_bounds);

      notifyListeners();
    }
  }

  @override
  void dispose() {
    selectedLocation!.close();
    bounds!.close();
    super.dispose();
  }

}