import 'dart:convert';

import 'package:myandroidapp/src/parallax/card_provider.dart';
import 'package:myandroidapp/src/products/items_details.dart';
import 'package:myandroidapp/src/products/products_search_provider.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatefulWidget {
  static const routeName = "/searchResultRoute";
  final SettingsController? controller;
  final String? label;
  const SearchResultPage({super.key, this.controller, this.label});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  ProductsSearchProvider? productsSearchProvider;
  List? productsSearchList;
  //
  CardProvider? cardProvider;
  //
  String? selectedCategory;
  List? supplementList;
  List? skincareList;
  List? makeupList;
  List? perfumeList;
  List? coffeeList;
  //

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  //
  String? jsonList;
  List<Map<String, dynamic>?>? parsedList;
  List<Widget>? itemsList;
  final GlobalKey _itemKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    //
    selectedCategory = '';
    //
    supplementList = List.empty(growable: true);
    skincareList = List.empty(growable: true);
    makeupList = List.empty(growable: true);
    perfumeList = List.empty(growable: true);
    coffeeList = List.empty(growable: true);
    //
    Future.delayed(Duration(seconds: 3), () {
      // Convert the list to a JSON string
      jsonList = jsonEncode(productsSearchList);

      // Parse the JSON string to get the original data
      parsedList = List<Map<String, dynamic>>.from(jsonDecode(jsonList!));

      // Assign each item in the list to a variable
      for (int i = 0; i < parsedList!.length; i++) {
        String itemName = parsedList![i]!['name'];
        double itemPrice = parsedList![i]!['price'];

        print('Item $i: Name: $itemName, Price: $itemPrice');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    cardProvider = Provider.of<CardProvider>(context);
    selectedCategory = cardProvider!.category;
    //
    productsSearchProvider = Provider.of<ProductsSearchProvider>(context);
    productsSearchList = productsSearchProvider!.productsSearchList;
    //
    return AnimatedList(
      key: _listKey,
      initialItemCount: productsSearchList!.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(productsSearchList![index], animation, index);
      },
    );
  }

  Widget _buildItem(Item item, Animation<double> animation, int index) {
    return Hero(
      tag: 'item-${item.name}-$index',
      child: FadeTransition(
        opacity: animation,
        child: ListTile(
          leading: Image.asset(
            item.image!,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          title: Text(item.name!),
          subtitle: Text(item.details!),
          trailing: Text('\$${item.price!.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
