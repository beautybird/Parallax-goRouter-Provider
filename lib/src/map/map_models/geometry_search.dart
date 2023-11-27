

/*
* This related to Step 2 ...we extract the  location object from the geometry object
*
* */


import 'package:myandroidapp/src/map/map_models/location_search.dart';

class GeometrySearch{

  final LocationSearch? locationSearch;

  GeometrySearch({this.locationSearch});

  factory GeometrySearch.fromJson(Map<dynamic,dynamic> geometryJson){
    return GeometrySearch(
      locationSearch: LocationSearch.fromJson(geometryJson['location']),
    );
  }
}