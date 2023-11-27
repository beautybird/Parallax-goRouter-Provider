import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';
import 'package:myandroidapp/src/shared_widgets/form_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

class Login extends StatefulWidget {
  static const routeName = '/loginRoute';
  final SettingsController? controller;

  const Login({Key? key, this.controller}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LocaleProvider? localeProvider;
  String? selectedLocaleCode;
  _LoginState();

  final _loginFormKey = GlobalKey<FormState>();
  /*...Create a controller for every field ...*/
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /*...Make sure the field has value entered ...*/
  String? emailValue;
  String _emailLatestValue() {
    return emailValue =
        ((_emailController.text).isNotEmpty ? _emailController.text : '');
  }

  String? passwordValue;
  String _passwordLatestValue() {
    return passwordValue =
        ((_passwordController.text).isNotEmpty ? _passwordController.text : '');
  }

  late final StreamSubscription<supa.AuthState> _authSubscription;
  supa.User? _user;
  supa.AuthResponse? authResponse;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _emailController.addListener(() {
      _emailLatestValue();
    });
    _passwordController.addListener(() {
      _passwordLatestValue();
    });
  }

  ////
  bool _loginButtonClicked = true;

  /* ... Fields Patterns ...*/
  final Pattern emailPattern = "/[\w-\.]+@([\w-]+\.)+[\w-]{2,4}/";
  //final Pattern passwordPattern = '/(?=.*?[#?!@\$%^&*-])/';
  final Pattern passwordPattern =
      '/(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&+=])(?=\S+).{8,}/';
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();

    //
    _authSubscription.cancel();
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Applying new selected locale on this page
    localeProvider = Provider.of<LocaleProvider>(context);
    selectedLocaleCode = localeProvider!.selectedLocaleCode;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5.0),
          //color: Colors.grey.shade200,
          constraints: BoxConstraints(
            minWidth: double.maxFinite,
            maxWidth: double.maxFinite,
            minHeight: double.maxFinite,
            maxHeight: double.maxFinite,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6).withOpacity(0.4),
            border: Border.all(
              color: Colors.green,
              width: 0.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            backgroundBlendMode: BlendMode.color,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Icon(
                Icons.lock,
                size: 80.0,
                color: Colors.blue,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome Back'.tr().toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              Form(
                key: _loginFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Email Text
                          StandardFormTextField(
                            controller: _emailController,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            fieldBorderColor: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            fontColor: Colors.black,
                            prefixIcon: Icons.email,
                            prefixIconColor: Colors.green,
                            suffixTooltip:
                                'generalUse-enterEmail'.tr().toString(),
                            obsecureText: false,
                            maxLines: 1,
                            formTextFieldLabel:
                                'generalUse-enterEmail'.tr().toString(),
                            validate: (stringEmailValue) =>
                                stringEmailValue!.isEmpty == true
                                    ? 'generalUse-fillAllDetails'
                                        .tr()
                                        .toString()
                                    : null,
                            suffixOnPressed: () => _emailController.clear(),
                            locale: Locale(localeProvider!.selectedLocaleCode!,
                                localeProvider!.selectedLocaleCountry),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          //Password Text
                          StandardFormTextField(
                            controller: _passwordController,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            fieldBorderColor: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            fontColor: Colors.black,
                            prefixIcon: Icons.security,
                            prefixIconColor: Colors.green,
                            suffixTooltip:
                                'generalUse-password'.tr().toString(),
                            obsecureText: true,
                            maxLines: 1,
                            formTextFieldLabel:
                                'generalUse-password'.tr().toString(),
                            validate: (stringPassValue) =>
                                stringPassValue!.isEmpty == true
                                    ? 'generalUse-fillAllDetails'
                                        .tr()
                                        .toString()
                                    : null,
                            suffixOnPressed: () => _passwordController.clear(),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          //Login Button
                          Container(
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(
                              minWidth: double.minPositive,
                              maxWidth: double.minPositive,
                              minHeight: 50.0,
                              maxHeight: 50.0,
                            ),
                            child: StandardElevatedButton(
                              backgroundBaseColor: _loginButtonClicked == true
                                  ? Colors.blue
                                  : Colors.tealAccent,
                              foregroundBaseColor: Colors.white,
                              buttonMinWidth: 60.0,
                              buttonMaxWidth: 60.0,
                              buttonMinHeight: 50.0,
                              buttonMaxHeight: 50.0,
                              autofocus: false,
                              buttonShape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                              child: Icon(
                                Icons.login,
                                size: 30.0,
                                fill: 0.5,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  _loginFormKey.currentState!.save();
                                  //Apply gesture Detector on Register Button Color
                                  _loginButtonClicked = !_loginButtonClicked;

                                  /*..Now we check the email & password with the DB ,if
                                 verified then user can login to his/her account*/
                                } else {
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.white,
                                        elevation: 10.0,
                                        shape: Border.all(
                                          color: Colors.orange,
                                          width: 0.5,
                                          style: BorderStyle.solid,
                                        ),
                                        content: Text(
                                          'generalUse-fillAllDetails'
                                              .tr()
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            letterSpacing: 1.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                    /* Timer(const Duration(seconds: 4), () {
                                      Navigator.pushNamed(
                                          context, '/loginRoute');
                                    });*/
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              //Login With Other Socials
              /*Column(
                children: [
                  SizedBox(height: 10.0,),
                  SignInButton(
                    Buttons.googleDark,
                    onPressed: (){
                      UserCredential? signInWithGoogle = AuthService().signInWithGoogle();
                      if(signInWithGoogle != null){
                        Navigator.pushNamed(context, "/");
                      }else{
                        //
                      }
                    },
                  ),
                  SizedBox(height: 10.0,),
                  SignInButton(Buttons.appleDark, onPressed: (){}),
                  SizedBox(height: 10.0,),
                  SignInButton(Buttons.facebook, onPressed:(){}),
                ],
              ),*/
              const SizedBox(
                height: 40.0,
              ),
              //Forgot Password  Buttons
              /*Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: TextButton(
                  child: Text(
                    'generalUse-forgotPassword'.tr().toString(),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () => context.go(detailsPath),
                ),
              ),*/
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      //bottomNavigationBar: NavigationBarSection(),
    );
  }
}
