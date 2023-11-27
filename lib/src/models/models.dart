import 'package:myandroidapp/src/database/fetch_database.dart';

class Models {
  //Persist  the seller details in DB

  bool? loginFuture;
  Future<bool?>? login(
    String? emailValue,
    String? passwordValue,
    String? mobileValue,
  ) async {
    return loginFuture;
  }

  String? registerFuture;
  Future<String?>? register(
    String? emailValue,
    String? passwordValue,
    String? mobileValue,
  ) async {
    return registerFuture;
  }

  List<List>? fetchProductsFuture;
  Future<List<List>?>? getFetchProducts(String? category) async {
    fetchProductsFuture = await FetchDatabase().fetchProductsData(category);
    return fetchProductsFuture!;
  }
}
