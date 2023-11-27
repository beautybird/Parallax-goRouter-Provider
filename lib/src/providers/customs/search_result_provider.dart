


import 'package:flutter/material.dart';

class SearchResultProvider with ChangeNotifier{

  List<List?>? _searchResultList;
  List<List?>? _vehicleSearchResultList;
  List<List?>? _realestateSearchResultList;
  List<List?>? _shipSearchResultList;
  int? _shopID;


  SearchResultProvider(){
    _searchResultList = List.empty(growable: true);
    _vehicleSearchResultList = List.empty(growable: true);
    _realestateSearchResultList = List.empty(growable: true);
    _shipSearchResultList = List.empty(growable: true);
    _shopID = 0;
  }

  List<List?>? get searchResultList => _searchResultList;
  void setSearchResultList(List<List> searchResultList){
    _searchResultList = _searchResultList;
    notifyListeners();
  }

  List<List?>? get vehicleSearchResultList => _vehicleSearchResultList;
  void setVehicleResultList(List<List> vehicleResultList){
    _vehicleSearchResultList = vehicleResultList;
    notifyListeners();
  }

  List<List?>? get realestateSearchResultList => _realestateSearchResultList;
  void setRealestateResultList(List<List> realestateResultList){
    _realestateSearchResultList = realestateResultList;
    notifyListeners();
  }

  List<List?>? get shipSearchResultList => _shipSearchResultList;
  void setShipResultList(List<List> shipResultList){
    _shipSearchResultList = shipResultList;
    notifyListeners();
  }

  int? get shopId => _shopID;

  void setShopID(int? shopID){
    _shopID = shopID;
    notifyListeners();
  }

}