

import 'package:flutter/material.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';

class RegisterRoute extends StatefulWidget {

  static const routeName="/registerRoute";
  final SettingsController? controller;
  const RegisterRoute({Key? key,this.controller}) : super(key: key);

  @override
  State<RegisterRoute> createState() => _RegisterRouteState();
}

class _RegisterRouteState extends State<RegisterRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
