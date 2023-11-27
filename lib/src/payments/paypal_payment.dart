import 'dart:core';
import 'package:flutter/material.dart';
import 'package:myandroidapp/src/payments/sellerPlan.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';


class PaypalPayment extends StatefulWidget {
  static const routeName = '/paypalPayment';
  final SettingsController? controller;

  const PaypalPayment({Key? key,this.controller}) : super(key: key);

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  String? itemName;
  String? itemPrice;
  String? itemCode;

  _PaypalPaymentState();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PlanAttributes;
    itemName = args.sellerPlanNameValue;
    itemCode = args.sellerPlanCodeValue;
    itemPrice = args.sellerPlanPriceValue;

    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Payment',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: Text(''),
    );
  }
}
