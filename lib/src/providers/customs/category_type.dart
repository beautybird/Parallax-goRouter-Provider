import 'package:flutter/material.dart';

class SelectedCategoryTypeProvider with ChangeNotifier {
  String? _type;
  String? _vehicleCategory;
  String? _realestateCategory;
  String? _shipCategory;

  SelectedCategoryTypeProvider() {
    _type = "";
    _vehicleCategory = "";
    _realestateCategory = "";
    _shipCategory = "";
  }

  String? get type => _type;
  String? get vehicleCategory => _vehicleCategory;
  String? get realestateCategory => _realestateCategory;
  String? get shipCategory => _shipCategory;


  void setType(String type){
    _type = type;
    notifyListeners();
  }

  void setVehicleCategory(String vehicleCategory){
    _vehicleCategory = vehicleCategory;
    notifyListeners();
  }

  void setRealestateCategory(String realestateCategory){
    _realestateCategory = realestateCategory;
    notifyListeners();
  }

  void setShipCategory(String shipCategory){
    _shipCategory = shipCategory;
    notifyListeners();
  }
}
