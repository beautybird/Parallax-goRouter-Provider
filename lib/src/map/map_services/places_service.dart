import 'package:http/http.dart' as http;
import 'package:myandroidapp/src/map/map_models/place_name_search.dart';
import 'dart:convert' as convert;

import 'package:myandroidapp/src/map/map_models/place_search.dart';

class PlacesService {
  http.Response? response;
  http.Response? getPlacesResponse, getPlaceResponse;
  dynamic json, getPlaceJson, getPlacesJson;
  List? autocompleteJsonResults;
  List<dynamic>? getPlacesJsonResults;
  Map<String, dynamic>? getPlaceJsonResults;
  Uri? autocompleteUri;
  Uri? getPlaceUri;
  Uri? getPlacesUri;

  var key = 'AAdd Your API Key ';

  // This related to Step 1 ..we get a list of PlaceSearch object
  Future<List<PlaceSearch>> getSearchAutocomplete(String? search) async {
    //print('street is $search');

    autocompleteUri = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=address&key=$key');
    response = await http.get(autocompleteUri!);
    json = convert.jsonDecode(response!.body);
    autocompleteJsonResults = json['predictions'] as List;

    return autocompleteJsonResults!
        .map((place) => PlaceSearch.fromJason(place))
        .toList();
  }

  //This related to Step 2 ..from place details
  Future<PlaceName> getPlace(String? placeId) async {
    getPlaceUri = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key');
    getPlaceResponse = await http.get(getPlaceUri!);
    getPlaceJson = convert.jsonDecode(getPlaceResponse!.body);
    //print('getPlaceJson is $getPlaceJson');
    getPlaceJsonResults = getPlaceJson['result'] as Map<String, dynamic>;
    return PlaceName.fromJson(getPlaceJsonResults!);
  }

  Future<List<PlaceName>> getPlaces(
      double lat, double lng, String placeType) async {
    getPlaceUri = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key');
    getPlacesResponse = await http.get(getPlacesUri!);
    getPlacesJson = convert.jsonDecode(getPlacesResponse!.body);
    getPlacesJsonResults = json['results'] as List;
    return getPlacesJsonResults!
        .map((place) => PlaceName.fromJson(place))
        .toList();
  }
}
