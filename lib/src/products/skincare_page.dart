import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class SkincarePage extends StatefulWidget {
  static const routeName = "/secondRoute";
  final SettingsController? controller;
  final String? label;
  const SkincarePage({super.key, this.controller, this.label});

  @override
  State<SkincarePage> createState() => _SkincarePagePageState();
}

class _SkincarePagePageState extends State<SkincarePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Second Page',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
