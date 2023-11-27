import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:myandroidapp/src/utilities/classes.dart';


class StreamCityCountry{

    // Create a stream from CitiesStatesCountries

  late StreamController<String?>? _cityCountryStreamController;
  late Stream<String?>? _cityCountryStream ;
  late StreamSubscription<String?>? _cityCountryStreamSubscription;

  CitiesStatesCountries? citiesStatesCountries;
  List<String?>? countriesCitiesList ;

  StreamCityCountry(){
    _cityCountryStream = _cityCountryStreamController!.stream.asBroadcastStream(
      /*  onListen:_cityCountryStreamSubscription!.onData((data) {;}),
    onCancel: _cityCountryStreamSubscription!.onDone(() { })*/);
    countriesCitiesList = CitiesStatesCountries.countriesCities;

    _cityCountryStreamSubscription = _cityCountryStream!.listen((data) {
      //
    },onError: (err){err.toString();}
        ,cancelOnError: false
        ,onDone: (){
      //
      },
    );

    _cityCountryStreamController!.sink.addStream(_cityCountryStream!);
  }

}