import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:myandroidapp/src/products/products_search_provider.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupplementPage extends StatefulWidget {
  static const routeName = "/firstRoute";
  final SettingsController? controller;
  final String? label;
  const SupplementPage({super.key, this.label, this.controller});

  @override
  State<SupplementPage> createState() => _SupplementPageState();
}

class _SupplementPageState extends State<SupplementPage> {
  ///Locale
  LocaleProvider? localeProvider;
  String? selectedLocaleCode;

  ///Products provider
  ProductsSearchProvider? productsSearchProvider;

  ///

  @override
  void initState() {
    // TODO: implement initState
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
    localeProvider = Provider.of<LocaleProvider>(context);
    selectedLocaleCode = localeProvider!.selectedLocaleCode;
    //
    productsSearchProvider = Provider.of<ProductsSearchProvider>(context);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' First Page',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
