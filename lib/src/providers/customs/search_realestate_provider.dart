import 'package:flutter/material.dart';

class SearchRealestateProvider with ChangeNotifier{
    List<List?>? _realestateSearchResultList;
    int? _shopId;
    String? _typeValue;
    bool? _agent;
    bool? _owner;
    bool? _rent;
    bool? _buy;
    bool? _commercial;
    bool? _residential;

    SearchRealestateProvider(){
      _agent= false;
      _owner = false;
      _rent = false;
      _buy = false;
      _commercial =  false;
      _residential = false;
    }

    List<List?>? get realestateSearchResultList => _realestateSearchResultList;

    void setRealestateSearchResultList(List<List?>? realestateSearchResult){
      _realestateSearchResultList = realestateSearchResult;
      notifyListeners();
    }
    int? get shopId => _shopId;

    void setShopID(int? shopId){
      _shopId = shopId;
      notifyListeners();
    }

    bool? get owner => _owner;
    void setOwner(bool? ownerValue){
      _owner = ownerValue;
      notifyListeners();
    }

    bool? get agent => _agent;
    void setAgent(bool? agentValue){
      _agent = agentValue;
      notifyListeners();
    }

    bool? get rent => _rent;
    void setRent(bool? rentValue){
      _rent = rentValue;
      notifyListeners();
    }

    bool? get buy => _buy;
    void setBuy(bool? buyValue){
      _buy = buyValue;
      notifyListeners();
    }

    bool? get commercial => _commercial;
    void setCommercial(bool? commercialValue){
      _commercial = commercialValue;
      notifyListeners();
    }

    bool? get residential => _residential;
    void setResidential(bool? residentialValue){
      _residential = residentialValue;
      notifyListeners();
    }



}