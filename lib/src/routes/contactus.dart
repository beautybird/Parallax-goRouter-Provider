import 'package:flutter/material.dart';
import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:contactus/contactus.dart';

class Contactus extends StatelessWidget {
  static const routeName = '/contactusRoute';

  final SettingsController? controller;
  LocaleProvider? localeProvider;
  String? selectedLocaleCode;

  Contactus({Key? key, this.controller, this.selectedLocaleCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Applying new selected locale on this page
    localeProvider = Provider.of<LocaleProvider>(context);
    selectedLocaleCode = localeProvider!.selectedLocaleCode;

    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'generalUse-contactUs'.tr().toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),*/
      body: ContactUs(
        cardColor: Colors.blue.shade300,
        /*logo: AssetImage(
          'assets/images/contactus.jpg',
        ),*/
        image: Image(
          image: AssetImage('assets/images/contactus.jpg'),
          fit: BoxFit.fill,
          width: 300.0,
          height: 150.0,
        ),
        email: 'starafter50@gmail.com',
        companyName: 'Dezire Tech Com',
        companyColor: Colors.blue,
        companyFontSize: 20.0,
        companyFontWeight: FontWeight.w400,
        phoneNumber: '+60-1162277805',
        dividerThickness: 2,
        //website: 'https://abhishekdoshi.godaddysites.com',
        githubUserName: 'beautybird',
        //linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
        tagLine: 'Postgresql Developer & Android',
        taglineColor: Colors.black,
        taglineFontWeight: FontWeight.normal,
        twitterHandle: 'database_nerd',
        instagram: 'Dezireapp',
        textColor: Colors.white,
      ),
      resizeToAvoidBottomInset: true,
      //bottomNavigationBar: NavigationBarSection(),
    );
  }
}
