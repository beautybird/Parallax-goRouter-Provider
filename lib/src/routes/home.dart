import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';


class Home extends StatefulWidget {
  static const routeName = '/homeRoute';

  final SettingsController? controller;

  const Home({Key? key, this.controller}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color baseColor = const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          "Flutter App Design",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: baseColor,
        toolbarOpacity: 0.5,
        actions: [
          IconButton(
            iconSize: 30.0,
            color: Colors.black,
            disabledColor: Colors.grey,
            splashColor: Colors.yellow,
            //iconConstraints: BoxConstraints(maxWidth: 30.0,maxHeight: 30.0,),
            autofocus: false,
            icon: const Icon(
              CarbonIcons.settings,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 900.0,
          maxHeight: 900.0,
        ),
        color: Colors.grey[200],
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            ///The app
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70.0,
              ),
              child: Card(
                color: Colors.teal[200],
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        "Our App",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: StandardElevatedButton(
                          backgroundBaseColor: Colors.blue,
                          foregroundBaseColor: Colors.white,
                          buttonMinWidth: 100.0,
                          buttonMaxWidth: 100.0,
                          buttonMinHeight: 40.0,
                          buttonMaxHeight: 40.0,
                          autofocus: false,
                          onHover: (value) {},
                          onFocusChanged: (value) {},
                          child: const Text(
                            "Enter",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                          onPressed: () =>
                              Navigator.pushNamed(context, "/appMainRoute"),
                        ),
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
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
            ///Database
            Card(
              color: Colors.grey[300],
              elevation: 10.0,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              borderOnForeground: true,
              margin: const EdgeInsets.all(3.0),
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      "Database",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: StandardElevatedButton(
                            backgroundBaseColor: Colors.blue[300],
                            foregroundBaseColor: Colors.white,
                            buttonMinWidth: 100.0,
                            buttonMaxWidth: 100.0,
                            buttonMinHeight: 40.0,
                            buttonMaxHeight: 40.0,
                            autofocus: false,
                            onHover: (value) {},
                            onFocusChanged: (value) {},
                            child: const Text(
                              "Model Class",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => Navigator.pushNamed(
                                context, "/loginRegisterPage"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: StandardElevatedButton(
                            backgroundBaseColor: Colors.red[300],
                            foregroundBaseColor: Colors.white,
                            buttonMinWidth: 100.0,
                            buttonMaxWidth: 100.0,
                            buttonMinHeight: 40.0,
                            buttonMaxHeight: 40.0,
                            autofocus: false,
                            onHover: (value) {},
                            onFocusChanged: (value) {},
                            child: const Text(
                              "Dio",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => Navigator.pushNamed(
                                context, "/loginRegisterPage"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: StandardElevatedButton(
                            backgroundBaseColor: Colors.purple[100],
                            foregroundBaseColor: Colors.white,
                            buttonMinWidth: 100.0,
                            buttonMaxWidth: 100.0,
                            buttonMinHeight: 40.0,
                            buttonMaxHeight: 40.0,
                            autofocus: false,
                            onHover: (value) {},
                            onFocusChanged: (value) {},
                            child: const Text(
                              "Dio Token",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: StandardElevatedButton(
                            backgroundBaseColor: Colors.blue[300],
                            foregroundBaseColor: Colors.white,
                            buttonMinWidth: 100.0,
                            buttonMaxWidth: 100.0,
                            buttonMinHeight: 40.0,
                            buttonMaxHeight: 40.0,
                            autofocus: false,
                            onHover: (value) {},
                            onFocusChanged: (value) {},
                            child: const Text(
                              "Connections Pool",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: StandardElevatedButton(
                            backgroundBaseColor: Colors.teal[200],
                            foregroundBaseColor: Colors.white,
                            buttonMinWidth: 100.0,
                            buttonMaxWidth: 100.0,
                            buttonMinHeight: 40.0,
                            buttonMaxHeight: 40.0,
                            autofocus: false,
                            onHover: (value) {},
                            onFocusChanged: (value) {},
                            child: const Text(
                              "PL/PGSQL",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: StandardElevatedButton(
                            backgroundBaseColor: Colors.purple[100],
                            foregroundBaseColor: Colors.white,
                            buttonMinWidth: 100.0,
                            buttonMaxWidth: 100.0,
                            buttonMinHeight: 40.0,
                            buttonMaxHeight: 40.0,
                            autofocus: false,
                            onHover: (value) {},
                            onFocusChanged: (value) {},
                            child: const Text(
                              "",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
            ///Providers
            const SizedBox(
              height: 20.0,
              child: Text(
                "Providers : All Details About",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 400.0,
                maxWidth: 400.0,
                minHeight: 200.0,
                maxHeight: 200.0,
              ),
              child: Card(
                color: Colors.grey[300],
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Default, ChangeNotifier & value Providers
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: StandardElevatedButton(
                        backgroundBaseColor: Colors.blue[200],
                        foregroundBaseColor: Colors.black,
                        buttonMinWidth: 300.0,
                        buttonMaxWidth: 300.0,
                        buttonMinHeight: 50.0,
                        buttonMaxHeight: 50.0,
                        autofocus: false,
                        onHover: (value) {},
                        onFocusChanged: (value) {},
                        child: const Text(
                          "Default, ChangeNotifier & value Providers",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, "/providersOneRoute"),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    //Proxy Provider & Future Priovider
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.purple[100],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 150.0,
                              buttonMaxWidth: 150.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Proxy Provider",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/providersTwo"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.purple[100],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Future Provider",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/futureProviderRoute"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    //Consumer & Selector
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.teal[200],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Consumer & Selector",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/providersThree"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.red[300],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Special Uses",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/specialUsesRoute"),
                            ),
                          ),
                          /* Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.grey,
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, ""),
                            ),
                          ),*/
                        ],
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
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
            ///App Data
            const SizedBox(
              height: 30.0,
              child: Text(
                "Control Your App Data",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 400.0,
                maxWidth: 400.0,
                minHeight: 150.0,
                maxHeight: 150.0,
              ),
              child: Card(
                color: Colors.grey[300],
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.blue,
                              foregroundBaseColor: Colors.black,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "StatefulBuilder",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/statefulWidgetPage"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.red[200],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Mixin",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/usingMixinPage"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.teal[200],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Builder",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/builderRoute"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.purple[100],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Filter Result",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/filterResultRoute"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.teal[200],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Search & Autocomplete",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/proxyProviderRoute"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.grey,
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Stream Subscription",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, "/specialUsesRoute"),
                            ),
                          ),
                        ],
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
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
            /// App Security
            Container(
              constraints: const BoxConstraints(
                minWidth: 400.0,
                maxWidth: 400.0,
                minHeight: 150.0,
                maxHeight: 150.0,
              ),
              child: Card(
                color: Colors.grey[300],
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "App Security",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.red[300],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 40.0,
                              buttonMaxHeight: 40.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Hashing Fields",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.blue[400],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 40.0,
                              buttonMaxHeight: 40.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "Secure Storage",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: StandardElevatedButton(
                              backgroundBaseColor: Colors.teal[200],
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 100.0,
                              buttonMaxWidth: 100.0,
                              buttonMinHeight: 40.0,
                              buttonMaxHeight: 40.0,
                              autofocus: false,
                              onHover: (value) {},
                              onFocusChanged: (value) {},
                              child: const Text(
                                "OTP Verification",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //drawer: DrawerWidget(),
    );
  }
}
