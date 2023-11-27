import 'package:flutter/material.dart';
import 'package:myandroidapp/src/map/map_design.dart';
import 'package:myandroidapp/src/map/search_address.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';

class AddressMap extends StatefulWidget {
  static const routeName = '/addressMapPage';

  final SettingsController? controller;

  const AddressMap({Key? key, this.controller}) : super(key: key);

  @override
  _AddressMapState createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      var addressProvider = Provider.of<SearchAddressProvider>(context);

      return Scaffold(
      appBar: AppBar(
        title: const Text('Address Map Location'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Address Name is :'+ addressProvider.addressResultList!.elementAt(0),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Searched Address is :' + addressProvider.addressResultList!.elementAt(1),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 15.0,),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5.0),
              constraints:const BoxConstraints(
                minWidth: 350.0,
                maxWidth: 350.0,
                minHeight: 300.0,
                maxHeight: 300.0,
              ),
              color: null,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green, Colors.tealAccent],
                  stops: [0.1, 0.9],
                  transform: GradientRotation(0.45),
                ),
                backgroundBlendMode: null,
                shape: BoxShape.rectangle,
              ),
              child:const MapDesign(),
            ),
          ),
        ],
      ),
    );
  }
}
