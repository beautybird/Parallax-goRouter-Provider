import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class MakeupPage extends StatefulWidget {
  static const routeName="/makeupRoute";
  final SettingsController? controller;
  final String? label;
  const MakeupPage({super.key,this.controller,this.label});

  @override
  State<MakeupPage> createState() => _MakeupPageState();
}

class _MakeupPageState extends State<MakeupPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(title: Text('makeup'),),
      ),
    );
  }
}
