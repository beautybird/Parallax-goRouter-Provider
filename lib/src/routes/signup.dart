import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:myandroidapp/src/security/hash_password.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';
import 'package:myandroidapp/src/shared_widgets/form_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

//https://supabase.com/docs/guides/getting-started/tutorials/with-flutter?database-method=sql&platform=android

class SignUpPage extends StatefulWidget {
  static const routeName = "/signupRoute";
  final SettingsController? controller;
  final String? label;

  const SignUpPage({super.key, this.controller, this.label});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  //
  LocaleProvider? localeProvider;
  String? selectedLocaleCode;
  //
  bool? isLoading = false;

  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Methods to get the latest value of each form text field
  String? _customerEmailText;
  String? _emailFieldLatestValue() {
    return _customerEmailText = ((_emailController.text).isNotEmpty == true
        ? _emailController.text
        : "");
  }

  String? _confirmEmailText;
  String? _confEmailFieldLatestValue() {
    _confirmEmailText = ((_confirmEmailController.text).isNotEmpty
        ? _confirmEmailController.text
        : '');
    return _confirmEmailText;
  }

  String? _passwordTextValue;
  String? _passwordFieldLatestValue() {
    return _passwordTextValue = ((_passwordController.text).isNotEmpty == true
        ? _passwordController.text
        : "");
  }

  String? _confPasswordTextValue;
  String? _confPasswordFieldLatestValue() {
    return _confPasswordTextValue =
        ((_confPasswordController.text).isNotEmpty == true
            ? _confPasswordController.text
            : "");
  }

  supa.AuthResponse? response;
  //
  //This will be used when user onPressed() to persist the new account
  String? hashedPass;

  //
  /// Register button color changing
  bool? registerButtonColor = true;

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///
    // Start listening to changes in fields upon entering text.
    _emailController.addListener(() {
      _emailFieldLatestValue();
    });
    _confirmEmailController.addListener(() {
      _confEmailFieldLatestValue();
    });

    _passwordController.addListener(() {
      _passwordFieldLatestValue();
    });

    _confPasswordController.addListener(() {
      _confPasswordFieldLatestValue();
    });

    /// This the redirect link
    /*SupabaseConn.supabaseClient!.auth.onAuthStateChange.listen((data) {
      if (_redirecting!) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        context.go('/a');
      }
    });*/

    ///
    hashedPass = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _confirmEmailController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Applying new selected locale on this page
    localeProvider = Provider.of<LocaleProvider>(context);
    selectedLocaleCode = localeProvider!.selectedLocaleCode;

    //
    return Placeholder(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          toolbarHeight: 15.0,
          foregroundColor: Colors.transparent,
          scrolledUnderElevation: 15.0,
          elevation: 15.0,
          shadowColor: Colors.grey.withOpacity(0.5),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    //Email
                    StandardFormTextField(
                      controller: _emailController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      fieldBorderColor: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.black,
                      prefixIcon: Icons.email,
                      prefixIconColor: Colors.teal,
                      suffixTooltip: 'generalUse-enterEmail'.tr().toString(),
                      obsecureText: false,
                      maxLines: 1,
                      formTextFieldLabel:
                          'generalUse-enterEmail'.tr().toString(),
                      validate: (stringFieldValue) =>
                          stringFieldValue!.isEmpty == true
                              ? 'generalUse-fillAllDetails'.tr().toString()
                              : stringFieldValue.contains('@') != true
                                  ? 'Email Address Wrong'.tr().toString()
                                  : null,
                      suffixOnPressed: () => _emailController.clear(),
                      locale: Locale(localeProvider!.selectedLocaleCode!,
                          localeProvider!.selectedLocaleCountry),
                      contextMenuBuilder: (BuildContext context,
                          EditableTextState editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          anchors: editableTextState.contextMenuAnchors,
                          // Build the default buttons, but make them look custom.
                          // In a real project you may want to build different
                          // buttons depending on the platform.
                          children: editableTextState.contextMenuButtonItems
                              .map((ContextMenuButtonItem buttonItem) {
                            return Text('');
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Confirm Email
                    StandardFormTextField(
                      controller: _confirmEmailController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      fieldBorderColor: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.black,
                      prefixIcon: Icons.email,
                      prefixIconColor: Colors.teal,
                      suffixTooltip: 'generalUse-confirmEmail'.tr().toString(),
                      obsecureText: false,
                      maxLines: 1,
                      formTextFieldLabel:
                          'generalUse-confirmEmail'.tr().toString(),
                      validate: (emailStringValue) => emailStringValue!
                                  .isEmpty ==
                              true
                          ? 'registerAccount-fillDetails'.tr().toString()
                          : _confirmEmailController.text
                                          .contains(_emailController.text) !=
                                      true ||
                                  _confirmEmailController.text.contains('@') !=
                                      true
                              ? "generalUse-confirmEmailNotMatch"
                                  .tr()
                                  .toString()
                              : null,
                      suffixOnPressed: () => _confirmEmailController.clear(),
                      locale: Locale(localeProvider!.selectedLocaleCode!,
                          localeProvider!.selectedLocaleCountry),
                      contextMenuBuilder: (BuildContext context,
                          EditableTextState editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          anchors: editableTextState.contextMenuAnchors,
                          // Build the default buttons, but make them look custom.
                          // In a real project you may want to build different
                          // buttons depending on the platform.
                          children: editableTextState.contextMenuButtonItems
                              .map((ContextMenuButtonItem buttonItem) {
                            return Text('');
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Password
                    StandardFormTextField(
                      controller: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      fieldBorderColor: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.black,
                      prefixIcon: Icons.security,
                      prefixIconColor: Colors.teal,
                      suffixTooltip: 'generalUse-password'.tr().toString(),
                      obsecureText: true,
                      maxLines: 1,
                      formTextFieldLabel: 'generalUse-password'.tr().toString(),
                      validate: (stringFieldValue) =>
                          stringFieldValue!.isEmpty == true
                              ? 'generalUse-fillAllDetails'.tr().toString()
                              : null,
                      suffixOnPressed: () => _passwordController.clear(),
                      locale: Locale(localeProvider!.selectedLocaleCode!,
                          localeProvider!.selectedLocaleCountry),
                      contextMenuBuilder: (BuildContext context,
                          EditableTextState editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          anchors: editableTextState.contextMenuAnchors,
                          // Build the default buttons, but make them look custom.
                          // In a real project you may want to build different
                          // buttons depending on the platform.
                          children: editableTextState.contextMenuButtonItems
                              .map((ContextMenuButtonItem buttonItem) {
                            return Text('');
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Confirm Password
                    StandardFormTextField(
                      controller: _confPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      fieldBorderColor: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.black,
                      prefixIcon: Icons.security,
                      prefixIconColor: Colors.teal,
                      suffixTooltip: 'generalUse-password'.tr().toString(),
                      obsecureText: true,
                      maxLines: 1,
                      formTextFieldLabel: 'generalUse-password'.tr().toString(),
                      validate: (stringFieldValue) =>
                          stringFieldValue!.isEmpty == true
                              ? 'generalUse-fillAllDetails'.tr().toString()
                              : null,
                      suffixOnPressed: () => _confPasswordController.clear(),
                      locale: Locale(localeProvider!.selectedLocaleCode!,
                          localeProvider!.selectedLocaleCountry),
                      contextMenuBuilder: (BuildContext context,
                          EditableTextState editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          anchors: editableTextState.contextMenuAnchors,
                          // Build the default buttons, but make them look custom.
                          // In a real project you may want to build different
                          // buttons depending on the platform.
                          children: editableTextState.contextMenuButtonItems
                              .map((ContextMenuButtonItem buttonItem) {
                            return Text('');
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    //Register Customer Button
                    StandardElevatedButton(
                        backgroundBaseColor: registerButtonColor == true
                            ? Colors.blue
                            : Colors.greenAccent.shade200,
                        foregroundBaseColor: Colors.white,
                        buttonMinWidth: 70.0,
                        buttonMaxWidth: 70.0,
                        buttonMinHeight: 50.0,
                        buttonMaxHeight: 50.0,
                        onHover: (value) {},
                        onFocusChanged: (value) {},
                        autofocus: false,
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
                        child: Icon(
                          Icons.app_registration,
                          size: 40.0,
                          fill: 0.7,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          //Changing Settings Button Color
                          registerButtonColor = !registerButtonColor!;

                          applyHashPassMethod()!.then((hashingFuture) {
                            if (hashingFuture!.isNotEmpty) {
                              registerCustomerMethod(context, hashingFuture);
                            } else {
                              setState(() {
                                Flushbar(
                                  duration: Duration(seconds: 5),
                                  title: 'generalUse-sorry'.tr().toString(),
                                  titleColor: Colors.red,
                                  titleSize: 20.0,
                                  message: 'generalUse-someWentWrong'
                                      .tr()
                                      .toString(),
                                  messageColor: Colors.black,
                                  messageSize: 16.0,
                                  messageText: Text('generalUse-someWentWrong'
                                      .tr()
                                      .toString()),
                                  titleText: Text(
                                    'generalUse-sorry'.tr().toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 20.0,
                                  ),
                                  shouldIconPulse: true,
                                  maxWidth: 250.0,
                                  margin: EdgeInsets.only(top: 300.0),
                                  padding: EdgeInsets.all(3.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderColor: Colors.black,
                                  borderWidth: 1.0,
                                  backgroundColor: Colors.grey.shade300,
                                  mainButton: Text(''),
                                  onTap: (value) {},
                                  isDismissible: true,
                                  dismissDirection:
                                      FlushbarDismissDirection.HORIZONTAL,
                                  flushbarPosition: FlushbarPosition.TOP,
                                  positionOffset: 0.0,
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                )..show(context);
                                Timer(const Duration(seconds: 3), () {
                                  context.go('/c');
                                });
                              });
                            }
                          }).onError((error, stackTrace) {
                            //
                            Flushbar(
                              duration: Duration(seconds: 5),
                              title: 'generalUse-sorry'.tr().toString(),
                              titleColor: Colors.red,
                              titleSize: 20.0,
                              message:
                                  'generalUse-someWentWrong'.tr().toString(),
                              messageColor: Colors.black,
                              messageSize: 16.0,
                              messageText: Text(
                                  'generalUse-someWentWrong'.tr().toString()),
                              titleText: Text(
                                'generalUse-sorry'.tr().toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                ),
                              ),
                              icon: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 20.0,
                              ),
                              shouldIconPulse: true,
                              maxWidth: 250.0,
                              margin: EdgeInsets.only(top: 300.0),
                              padding: EdgeInsets.all(3.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderColor: Colors.black,
                              borderWidth: 1.0,
                              backgroundColor: Colors.grey.shade300,
                              mainButton: Text(''),
                              onTap: (value) {},
                              isDismissible: true,
                              dismissDirection:
                                  FlushbarDismissDirection.HORIZONTAL,
                              flushbarPosition: FlushbarPosition.TOP,
                              positionOffset: 0.0,
                              flushbarStyle: FlushbarStyle.FLOATING,
                            )..show(context);
                            Timer(const Duration(seconds: 3), () {
                              context.go('/c');
                            });
                          }).whenComplete(() => null);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  void registerCustomerMethod(BuildContext context, String hashPass) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //Update Buyer Data info section..using Postgres
      //
    } else {
      setState(() {
        Flushbar(
          duration: Duration(seconds: 5),
          title: 'generalUse-sorry'.tr().toString(),
          titleColor: Colors.red,
          titleSize: 20.0,
          message: 'generalUse-fillAllDetails'.tr().toString(),
          messageColor: Colors.black,
          messageSize: 16.0,
          messageText: Text('generalUse-fillAllDetails'.tr().toString()),
          titleText: Text(
            'generalUse-sorry'.tr().toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
          ),
          icon: Icon(
            Icons.error,
            color: Colors.red,
            size: 20.0,
          ),
          shouldIconPulse: true,
          maxWidth: 250.0,
          margin: EdgeInsets.only(top: 300.0),
          padding: EdgeInsets.all(3.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderColor: Colors.black,
          borderWidth: 1.0,
          backgroundColor: Colors.grey.shade300,
          mainButton: Text(''),
          onTap: (value) {},
          isDismissible: true,
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 0.0,
          flushbarStyle: FlushbarStyle.FLOATING,
        )..show(context);
      });
    }
  }

  //
  Future<String?>? applyHashPassMethod() async {
    hashedPass = PasswordSecure().hash(_passwordTextValue);

    return hashedPass;
  }
}
