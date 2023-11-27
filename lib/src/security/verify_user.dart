
import 'package:flutter/material.dart';

class VerifyUserProvider with ChangeNotifier{

  String? _userEmail;
  String? _userMobile;

  VerifyUserProvider(){
    _userEmail = '';
    _userMobile = '';
  }

  String? get userEmail => _userEmail;
  void setUserEmail(String? email){
    _userEmail = email;
    notifyListeners();
  }

  String? get userMobile => _userMobile;
  void setUserMobile(String? mobile){
    _userMobile = mobile;
    notifyListeners();
  }

}