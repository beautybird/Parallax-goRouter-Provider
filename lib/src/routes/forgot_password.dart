import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:myandroidapp/src/security/hash_password.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';
import 'package:myandroidapp/src/shared_widgets/container.dart';
import 'package:myandroidapp/src/shared_widgets/form_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgotPasswordPage';
  final SettingsController? controller;
  ForgotPasswordPage({Key? key, this.controller}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ///Check the email registered or no
  final _checkEmailFormKey = GlobalKey<FormState>();
  final TextEditingController? _userEmailController = TextEditingController();
  String? _emailText;
  String? _getEmailText() {
    return _emailText = ((_userEmailController!.text).isNotEmpty
        ? _userEmailController!.text
        : '');
  }

  /// Send Verification Code
  //EmailOTP myauth = EmailOTP();
  final TextEditingController? otp = TextEditingController();
  final _resetPasswordFormKey = GlobalKey<FormState>();
  final _resetPasswordController = TextEditingController();

  String? _resetText;
  String? _getResetText() {
    return _resetText = ((_resetPasswordController.text).isNotEmpty
        ? _resetPasswordController.text
        : '');
  }

  bool? showOTPVerification;
  bool? showVerifyButton;
  bool? showResetPassword;

  @override
  void initState() {
    showOTPVerification = true;
    showVerifyButton = false;
    showResetPassword = false;

    //
    _userEmailController!.addListener(() {
      _getEmailText();
    });

    _resetPasswordController.addListener(() {
      _getResetText();
    });
    //
    super.initState();
  }

  @override
  void dispose() {
    _userEmailController!.dispose();
    _resetPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
        children: [
          //Check Email
          if (showOTPVerification!)
            ContainerStandard(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0.0),
              minWidth: double.maxFinite,
              maxWidth: double.maxFinite,
              minHeight: 150.0,
              maxHeight: 150.0,
              //color:Colors.white,
              boxBorder: Border.all(
                color: Colors.blue,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              boxBorderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              gradientColorOne: Colors.transparent,
              gradientColorTwo: Colors.transparent,
              child: Card(
                color: Colors.white,
                elevation: 10.0,
                shape: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                child: Form(
                  key: _checkEmailFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      //Email
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: StandardFormTextField(
                          controller: _userEmailController,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          fieldBorderColor: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontColor: Colors.black,
                          prefixIcon: Icons.email,
                          prefixIconColor: Colors.black,
                          suffixTooltip:
                              'generalUse-yourAccountEmail'.tr().toString(),
                          obsecureText: false,
                          maxLines: 1,
                          formTextFieldLabel:
                              'generalUse-yourAccountEmail'.tr().toString(),
                          validate: (stringEmailValue) =>
                              stringEmailValue!.isEmpty == true
                                  ? 'generalUse-fillAllDetails'.tr().toString()
                                  : null,
                          suffixOnPressed: () => _userEmailController!.clear(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      //Check Button
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: StandardElevatedButton(
                          backgroundBaseColor: Colors.blue,
                          foregroundBaseColor: Colors.white,
                          buttonMinWidth: 120.0,
                          buttonMaxWidth: 120.0,
                          buttonMinHeight: 30.0,
                          buttonMaxHeight: 30.0,
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
                          onHover: (value) {},
                          onFocusChanged: (value) {},
                          child: Text(
                            'generalUse-checkEmail'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          onPressed: () {
                            if (_checkEmailFormKey.currentState!.validate()) {
                              _checkEmailFormKey.currentState!.save();

                              /*..Now we check the email with the DB*/

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
                                _userEmailController!.clear();
                                Timer(const Duration(seconds: 2), () {
                                  Navigator.pushNamed(
                                      context, '/forgotPasswordPage');
                                });
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 10.0,
          ),
          if (showVerifyButton!)
            ContainerStandard(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0.0),
              minWidth: double.maxFinite,
              maxWidth: double.maxFinite,
              minHeight: 150.0,
              maxHeight: 180.0,
              //color:Colors.white,
              boxBorder: Border.all(
                color: Colors.blue,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              boxBorderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              gradientColorOne: Colors.transparent,
              gradientColorTwo: Colors.transparent,
              child: Card(
                color: Colors.white,
                elevation: 10.0,
                shape: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40.0,
                      child: Text(
                        'generalUse-checkOTPEmail'.tr().toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: otp,
                        decoration: InputDecoration(
                          hintText: "generalUse-enterOTPCodeHere".tr().toString(),
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: StandardElevatedButton(
                        backgroundBaseColor: Colors.blue,
                        foregroundBaseColor: Colors.white,
                        buttonMinWidth: 100.0,
                        buttonMaxWidth: 100.0,
                        buttonMinHeight: 40.0,
                        buttonMaxHeight: 40.0,
                        buttonShape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        autofocus: false,
                        elevation: 15.0,
                        padding: 1.0,
                        shadowColor: Colors.grey,
                        onHover: (value) {},
                        onFocusChanged: (value) {},
                        onPressed: () async {

                        },
                        child: const Text(
                          "Verify",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (showResetPassword!)
            ContainerStandard(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              minWidth: 350.0,
              maxWidth: 350.0,
              minHeight: 150.0,
              maxHeight: 150.0,
              //color:Colors.white,
              boxBorder: Border.all(
                color: Colors.blue,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              boxBorderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              gradientColorOne: Colors.transparent,
              gradientColorTwo: Colors.transparent,
              child: Form(
                key: _resetPasswordFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: StandardFormTextField(
                        controller: _resetPasswordController,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        fieldBorderColor: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.black,
                        prefixIcon: Icons.email,
                        prefixIconColor: Colors.black,
                        suffixTooltip: 'generalUse-password'.tr().toString(),
                        obsecureText: false,
                        maxLines: 1,
                        formTextFieldLabel:
                            'generalUse-password'.tr().toString(),
                        validate: (stringPassValue) =>
                            stringPassValue!.isEmpty == true
                                ? 'generalUse-fillAllDetails'.tr().toString()
                                : null,
                        suffixOnPressed: () => _resetPasswordController.clear(),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: StandardElevatedButton(
                        backgroundBaseColor: Colors.blue,
                        foregroundBaseColor: Colors.white,
                        buttonMinWidth: 100.0,
                        buttonMaxWidth: 100.0,
                        buttonMinHeight: 40.0,
                        buttonMaxHeight: 40.0,
                        buttonShape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        autofocus: false,
                        elevation: 15.0,
                        padding: 1.0,
                        shadowColor: Colors.grey,
                        onHover: (value) {},
                        onFocusChanged: (value) {},
                        onPressed: () {
                          if (_resetPasswordFormKey.currentState!.validate()) {
                            _resetPasswordFormKey.currentState!.save();

                            /// First we need hash the password

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
                                    'generalUse-fillAllDetails'.tr().toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                              /*_resetPasswordController.clear();
                              Timer(Duration(seconds: 3), () {
                                Navigator.pushNamed(context, '/loginRoute');
                              });*/
                            });
                          }
                        },
                        child: Text(
                          'generalUse-reset'.tr().toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

/*

  Widget? showVerifyCodeWidget(BuildContext context) => ContainerStandard(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        minWidth: 350.0,
        maxWidth: 350.0,
        minHeight: 150.0,
        maxHeight: 150.0,
        //color:Colors.white,
        boxBorder: Border.all(
          color: Colors.blue,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        boxBorderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradientColorOne: Colors.transparent,
        gradientColorTwo: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: otp,
              decoration: InputDecoration(
                  hintText: "generalUse-enterOTPCodeHere".tr().toString()),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            StandardElevatedButton(
              backgroundBaseColor: Colors.blue,
              foregroundBaseColor: Colors.white,
              buttonMinWidth: 100.0,
              buttonMaxWidth: 100.0,
              buttonMinHeight: 40.0,
              buttonMaxHeight: 40.0,
              autofocus: false,
              onHover: (value) {},
              onFocusChanged: (value) {},
              onPressed: () async {
                if (await myauth.verifyOTP(otp: otp!.text) == true) {
                  /// Here we show another form for user to start reset the password
                  setState(() {
                    resetPassword(context);
                  });
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
                          "generalUse-OTPInvalid".tr().toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  });
                }
              },
              child: const Text("Verify"),
            ),
          ],
        ),
      );
*/

/*
  Widget? resetPassword(BuildContext context) {
    return ContainerStandard(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      minWidth: 350.0,
      maxWidth: 350.0,
      minHeight: 300.0,
      maxHeight: 300.0,
      //color:Colors.white,
      boxBorder: Border.all(
        color: Colors.blue,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      boxBorderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      gradientColorOne: Colors.transparent,
      gradientColorTwo: Colors.transparent,
      child: Form(
        key: _resetPasswordFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: StandardFormTextField(
                controller: _resetPasswordController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                fieldBorderColor: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                fontColor: Colors.black,
                icon: Icons.email,
                suffixTooltip: 'login-passwordTooltip'.tr().toString(),
                obsecureText: false,
                maxLines: 1,
                formTextFieldLabel: 'login-password'.tr().toString(),
                validate: (stringPassValue) => stringPassValue!.isEmpty == true
                    ? 'login-passwordNotification'.tr().toString()
                    : null,
                suffixOnPressed: () => _resetPasswordController.clear(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
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
                onPressed: () {
                  /// First we need hash the password
                  applyHashPassMethod()!.then((hashedPass) {
                    if (hashedResetPass!.isNotEmpty) {
                      /// The reset password process
                      SearchModels()
                          .resetPasswordModel(_resetText)!
                          .then((resetPassFuture) {
                        ///
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Reset Successful')),
                          );
                        });
                      }).onError((error, stackTrace) {
                        ///
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Reset Failed')),
                          );
                        });
                      }).whenComplete(() => null);
                    } else {
                      /// If hashing the Reset password text goes wrong
                    }
                  }).onError((error, stackTrace) {
                    /// If hashing the Reset password text goes wrong
                  }).whenComplete(() => null);
                },
                child: Text('Reset'),
              ),
            )
          ],
        ),
      ),
    );
  }
*/

  String? hashedResetPass;
  Future<String?>? applyHashPassMethod() async {
    hashedResetPass = PasswordSecure().hash(_resetText);
    return hashedResetPass;
  }
}
