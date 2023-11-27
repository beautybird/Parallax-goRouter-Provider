import 'package:flutter/material.dart';

class SearchVehicleProvider with ChangeNotifier {
  List<List?>? _vehicleSearchResultList;
  List? _shopDetailsList;
  int? _shopID;
  String? _typeValue;
  bool? _agent;
  bool? _owner;
  bool? _rent;
  bool? _buy;

  SearchVehicleProvider(){
    _vehicleSearchResultList = [];
    _shopDetailsList = [];
    _shopID = 0;
    _agent = false;
    _owner = false;
    _rent = false;
    _buy = false;
  }

  List<List?>? get vehicleSearchResultList => _vehicleSearchResultList;
  void setVehicleSearchResultList(List<List?>? searchResult) {
    _vehicleSearchResultList = searchResult;
    notifyListeners();
  }

  int? get shopId => _shopID;

  void setShopID(int? shopID){
    _shopID = shopID;
    notifyListeners();
  }


  String? get typeValue => _typeValue;
  void setTypeValue(String? typeValue){
    _typeValue = typeValue;
    notifyListeners();
  }

  List? get shopDetailsList => _shopDetailsList;

  void setShopDetailsList(List? shopDetailsList) {
    _shopDetailsList = shopDetailsList;
    notifyListeners();
  }

  bool? get owner => _owner;
  void setOwner(bool? ownerValue){
    _owner = ownerValue;
    notifyListeners();
  }
  void changeOwner(bool? changedOwnerValue){
    if(_owner == false){
      _owner = true;
      _agent = false;
      notifyListeners();
    }else{
      _owner = false;
      _agent = true;
      notifyListeners();
    }
  }

  bool ? get agent => _agent;
  void setAgent(bool? agentValue){
    _agent = agentValue;
    notifyListeners();
  }

  void changeAgent(bool? changedAgentValue){
    if(_agent == false){
      _agent = true;
      _owner = false;
      notifyListeners();
    }else{
      _agent = false;
      _owner = true;
      notifyListeners();
    }
  }

  bool? get rent => _rent;
  void setRent(bool? rent){
    _rent = rent;
    notifyListeners();
  }

  void changeRent(bool? changedRentValue){
    if(_rent == false){
      _rent = true;
      _buy = false;
      notifyListeners();
    }else{
      _rent = false;
      _buy = true;
      notifyListeners();
    }
  }
  bool? get buy => _buy;
  void setBuy(bool? buy){
    _buy = buy;
    notifyListeners();
  }
  void changeBuy(bool? changedBuyValue){
    if(_buy == false){
      _buy = true;
      _rent = false;
      notifyListeners();
    }else{
      _buy = false;
      _rent = true;
      notifyListeners();
    }
  }


  void sortTheSearchVehicleList(){
    for(int i=0; i< vehicleSearchResultList!.length; i++){
     vehicleSearchResultList!.elementAt(i)!.map((e) => {
     });
    }
  }


  //
  static int? shopDetailsListLength;
  static int? vehicleSearchResultListLength;

  void getListLength() {
    if(vehicleSearchResultList != null && vehicleSearchResultList!.isNotEmpty){
      vehicleSearchResultListLength = vehicleSearchResultList!.length;

      vehicleSearchResultList!.map((e) => shopDetailsListLength = e!.length);
    }else{
      vehicleSearchResultListLength = 0;
      shopDetailsListLength = 0 ;
    }
  }
}
