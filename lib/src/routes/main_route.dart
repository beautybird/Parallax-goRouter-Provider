import 'package:flutter/material.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';

class AppMainRoute extends StatefulWidget {
  static const routeName = "/appMainRoute";
  final SettingsController? controller;
  const AppMainRoute({Key? key, this.controller}) : super(key: key);

  @override
  State<AppMainRoute> createState() => _AppMainRouteState();
}

class _AppMainRouteState extends State<AppMainRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Main Route',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //
        ],
      ),
      bottomSheet: Container(
        color: Colors.grey,
        constraints: const BoxConstraints(
          minWidth: double.maxFinite,
          minHeight: 70.0,
          maxHeight: 70.0,
        ),
        child: Image.asset(
          "assets/images/makeup4.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
