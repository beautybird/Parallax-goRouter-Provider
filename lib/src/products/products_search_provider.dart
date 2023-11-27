
import 'package:flutter/cupertino.dart';

class ProductsSearchProvider with ChangeNotifier{

  List? _productsSearchList;
  ProductsSearchProvider(){
    _productsSearchList = [];
  }

  List? get productsSearchList => _productsSearchList;
  void setProductsSearchList(List? productsSearchList){
    _productsSearchList = productsSearchList;
    notifyListeners();
  }
}