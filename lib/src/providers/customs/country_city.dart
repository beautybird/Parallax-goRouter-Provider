import 'package:flutter/material.dart';

class CountryCity with ChangeNotifier {
  //
  bool? _uae;
  bool? _ksa;
  bool? _oman;
  bool? _egypt;
  bool? _turkey;
  bool? _kuwait;

  String? _countryName;

  CountryCity() {
    _countryName = "";
    _uae = false;
    _ksa = false;
    _oman = false;
    _egypt = false;
    _turkey = false;
    _kuwait = false;
  }

  String? get getCountryName => _countryName;
  String? setCountryName(String? countyName){
    _countryName = countyName;
    notifyListeners();
    return null;
  }

  bool? get uae => _uae;
  bool? get ksa => _ksa;
  bool? get oman => _oman;
  bool? get egypt => _egypt;
  bool? get turkey => _turkey;
  bool? get kuwait => _kuwait;

  void changeUae(bool? changedValue) {
    if (_uae == false) {
      _uae = true;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    } else {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    }
  }

  void changeKsa(bool? changedValue) {
    if (_ksa == false) {
      _uae = false;
      _ksa = true;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    } else {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    }
  }

  void changeOman(bool? changedValue) {
    if (_oman == false) {
      _uae = false;
      _ksa = false;
      _oman = true;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    } else {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    }
  }

  void changeTurkey(bool? changedValue) {
    if (_turkey == false) {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = true;
      _kuwait = false;
      notifyListeners();
    } else {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    }
  }

  void changeEgypt(bool? changedValue) {
    if (_egypt == false) {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = true;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    } else {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    }
  }

  void changeKuwait(bool? changedValue) {
    if (_kuwait == false) {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = true;
      notifyListeners();
    } else {
      _uae = false;
      _ksa = false;
      _oman = false;
      _egypt = false;
      _turkey = false;
      _kuwait = false;
      notifyListeners();
    }
  }
}
