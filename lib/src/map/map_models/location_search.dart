

/*
* This related to Step 2 ...we extract the lat lng from the location object
* */
class LocationSearch{
  final double? lat;
  final double? lng;

  LocationSearch({this.lat,this.lng});

  factory LocationSearch.fromJson(Map<dynamic,dynamic> locationJson){

    return LocationSearch(
      lat:locationJson['lat'],
      lng:locationJson['lng']
    );
  }
}