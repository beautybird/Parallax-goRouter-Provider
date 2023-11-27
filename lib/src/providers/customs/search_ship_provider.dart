import 'package:flutter/material.dart';

class SearchShipProvider with ChangeNotifier {
  List<List?>? _shipSearchResultList;
  List? _shipDetailsList;
  int? _shopID;
  bool? _boat;
  bool? _yacht;
  bool? _shipCity;
  bool? _charter;
  bool? _sell;

  SearchShipProvider() {
    _shipSearchResultList = [];
    _shipDetailsList = [];
    _shopID = 0;
    _boat = false;
    _yacht = false;
    _shipCity = false;
    _charter = false;
    _sell = false;
  }

  List<List?>? get shipSearchResultList => _shipSearchResultList;
  void setShipSearchResultList(List<List?>? searchResult) {
    _shipSearchResultList = searchResult;
    notifyListeners();
  }

  int? get shopId => _shopID;

  void setShopID(int? shopID) {
    _shopID = shopID;
    notifyListeners();
  }

  bool? get shipCity => _shipCity;
  void setShipCity(bool? city) {
    _shipCity = city;
    notifyListeners();
  }

  bool? get charter => _charter;
  void setCharter(bool? charter) {
    _charter = charter;
    notifyListeners();
  }

  void changeCharter(bool? changedCharterValue) {
    if (_charter == false) {
      _charter = true;
      _sell = false;
      notifyListeners();
    } else {
      _charter = false;
      _sell = true;
      notifyListeners();
    }
  }

  bool? get sell => _sell;
  void setSell(bool? sell) {
    _sell = sell;
    notifyListeners();
  }

  void changeSell(bool? changedSellValue) {
    if (_sell == false) {
      _sell = true;
      _charter = false;
      notifyListeners();
    } else {
      _sell = false;
      _charter = true;
      notifyListeners();
    }
  }

  bool? get boat => _boat;
  void setBoat(bool? boat) {
    _boat = boat;
    notifyListeners();
  }

  void changeBoat(bool? changedBoatValue) {
    if (_boat == false) {
      _boat = true;
      _yacht = false;
      notifyListeners();
    } else {
      _boat = false;
      _yacht = true;
      notifyListeners();
    }
  }

  bool? get yacht => _yacht;
  void setYacht(bool? yacht) {
    _yacht = yacht;
    notifyListeners();
  }

  void changeYacht(bool? changedYachtValue) {
    if (_yacht == false) {
      _yacht = true;
      _boat = false;
      notifyListeners();
    } else {
      _yacht = false;
      _boat = true;
      notifyListeners();
    }
  }
}
