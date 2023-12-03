import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

  static const routeName = '/errorRoute';
  final SettingsController? controller;
  final String? label;
  const ErrorPage({super.key,this.controller,this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error '),
    );
  }
}
