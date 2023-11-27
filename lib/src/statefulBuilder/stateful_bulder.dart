import 'package:flutter/material.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/statefulBuilder/stateful_provider.dart';
import 'package:provider/provider.dart';

class StatefulWidgetPage extends StatefulWidget {
  static const routeName = "/statefulWidgetPage";
  final SettingsController? controller;
  const StatefulWidgetPage({Key? key, this.controller}) : super(key: key);

  @override
  State<StatefulWidgetPage> createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  StatefulProvider? statefulProvider;

  String? selectedImage;

  @override
  void initState() {
    selectedImage = "assets/images/flowersonsea.jpg";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    statefulProvider = Provider.of<StatefulProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("StatefulBuilder with StreamProvider"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          //Regular setState()
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'setState on all the widgets',
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Image.asset(
              selectedImage!,
              scale: 1,
              width: 300.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 300.0,
                maxWidth: 300.0,
                minHeight: 100.0,
                maxHeight: 100.0,
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: TextButton(
                      child: const Text(
                        'One',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () => setState(() {
                        selectedImage = "assets/images/art-blue1.png";
                      }),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: TextButton(
                      child: const Text(
                        'Two',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () => setState(() {
                        selectedImage = "assets/images/makeup4.jpg";
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Divider(
            height: 10.0,
            thickness: 10.0,
            indent: 30.0,
            endIndent: 30.0,
            color: Colors.red,
          ),
          const SizedBox(
            height: 20.0,
          ),
          //With Provider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextButton(
                    child: const Text(
                      'Image 1 with Provider',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      //selectedImage = statefulProvider!.imageOneAddress;
                      statefulProvider!.setImageOneAddress(
                          statefulProvider!.imageOneAddress);
                      statefulProvider!.changeImage();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextButton(
                    child: const Text(
                      'Image 2 with Provider',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      //selectedImage =statefulProvider!.imageTwoAddress;
                      statefulProvider!.setImageTwoAddress(
                          statefulProvider!.imageTwoAddress);
                      statefulProvider!.changeImage();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          //With Provider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Image.asset(
              statefulProvider!.currentImage!,
              scale: 1,
              width: 300.0,
              height: 100.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Divider(
            height: 10.0,
            thickness: 10.0,
            indent: 30.0,
            endIndent: 30.0,
            color: Colors.red,
          ),
          const SizedBox(
            height: 20.0,
          ),
          //With Stateful Builder
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 300.0,
                maxWidth: 300.0,
                minHeight: 200.0,
                maxHeight: 200.0,
              ),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                        child: Text(
                          "With Builder",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      //
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: TextButton(
                                child: const Text(
                                  'Image 1 with builder',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () => setState(() {
                                  selectedImage = "assets/images/makeup4.jpg";
                                }),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: TextButton(
                                child: const Text(
                                  'Image 2 with Builder',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () => setState(() {
                                  selectedImage = "assets/images/art-blue1.png";
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Image.asset(
                          selectedImage!,
                          scale: 1,
                          width: 300.0,
                          height: 200.0,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
