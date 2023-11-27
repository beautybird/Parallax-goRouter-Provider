import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';

class ShareApp extends StatelessWidget {
  static const routeName = "/shareappPage";
  final SettingsController? controller;

  LocaleProvider? localeProvider;
  String? selectedLocaleCode;

  ShareApp({Key? key, this.controller,this.selectedLocaleCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Applying new selected locale on this page
    var localeProvider = Provider.of<LocaleProvider>(context);
    selectedLocaleCode = localeProvider.selectedLocaleCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'generalUse-shareapp'.tr().toString(),
          style: const TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StandardElevatedButton(
              autofocus: false,
              buttonMinWidth: 300.0,
              buttonMaxWidth: 300.0,
              buttonMinHeight: 80.0,
              buttonMaxHeight: 80.0,
              backgroundBaseColor: Colors.white,
              foregroundBaseColor: Colors.white,
              buttonShape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              elevation: 10.0,
              padding: 3.0,
              shadowColor: Colors.grey,
              onHover: (value) {},
              onFocusChanged: (value) {},
              child:Text(
                'generalUse-shareLink'.tr().toString(),
                style: const TextStyle(
                  fontSize: 22.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              onPressed: () => Share.share(
                'https://play.google.com/store/apps/details?id=net.deziretechcom.tabarak&pli=1',
                subject: 'generalUse-subject'.tr().toString(),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
