

 /*
 * This related to Step 2 ...we extract the all values we want..name,vicinity
 * and geometry object
 * */


import 'package:myandroidapp/src/map/map_models/geometry_search.dart';

class PlaceName{
  final GeometrySearch? geometrySearch;
  final String? name;
  //final String? vicinity; //this used with types=cities

  PlaceName({this.geometrySearch,this.name});

  factory PlaceName.fromJson(Map<String,dynamic> placeNameJson){
    return PlaceName(
      geometrySearch: GeometrySearch.fromJson(placeNameJson['geometry']) ,
      name: placeNameJson['formatted_address']
     // vicinity: placeNameJson['vicinity']
    );
  }
}