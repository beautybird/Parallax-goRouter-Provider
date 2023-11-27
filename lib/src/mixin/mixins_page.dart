import 'package:flutter/material.dart';
import 'package:myandroidapp/src/mixin/mixin_one.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';

class UsingMixinPage extends StatefulWidget {
  static const routeName = "/usingMixinPage";
  final SettingsController? controller;
  const UsingMixinPage({Key? key, this.controller}) : super(key: key);

  @override
  State<UsingMixinPage> createState() => _UsingMixinPageState();
}

class _UsingMixinPageState extends State<UsingMixinPage> {
  final _fieldOneController = TextEditingController();

  String? fieldOneValue;
  String? _getMixinOneField() {
    fieldOneValue = ((_fieldOneController.text).isNotEmpty
        ? _fieldOneController.text
        : "0");
    return fieldOneValue;
  }

  //
  int? newValue = 0;
  int processTwoValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fieldOneController.addListener(() {
      _getMixinOneField();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fieldOneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mixin With Provider"),
      ),
      body: ListView(
        children: [
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 100.0,
                  maxHeight: 100.0,
                ),
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: TextButton(
                        child: const Text(
                          "Mixin One Process",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          newValue = FirstClass().processOne();
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        newValue.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: 150.0,
              maxHeight: 150.0,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: TextField(
                      controller: _fieldOneController,
                      decoration: const InputDecoration(
                        label: Text(
                          "Enter Number",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextButton(
                    child: const Text(
                      "Mixin Two Process",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      processTwoValue = FirstClass().processTwo(
                        int.parse(_fieldOneController.text),
                      )!;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    processTwoValue.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
