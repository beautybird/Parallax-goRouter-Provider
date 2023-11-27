import 'package:clay_containers/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:myandroidapp/src/payments/paypal_payment.dart';
import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';
import 'package:myandroidapp/src/shared_widgets/clay.dart';
import 'package:myandroidapp/src/shared_widgets/container.dart';
import 'package:provider/provider.dart';


class SellerPlan extends StatefulWidget {
  const SellerPlan({Key? key}) : super(key: key);

  @override
  _SellerPlanState createState() => _SellerPlanState();
}

class _SellerPlanState extends State<SellerPlan> {
  Color? baseColor = const Color(0xFFF2F2F2);

  LocaleProvider? localeProvider;
  String? selectedLocaleCode;
  _SellerPlanState({this.selectedLocaleCode});

  List<PlansList>? plans = [
    PlansList(
      planName: 'Select',
      planCode: '',
      planPrice: '',
      planDetails: '',
    ),
    PlansList(
        planName: 'Basic',
        planCode: 'Annu',
        planPrice: '20.0',
        planDetails: 'US / Annual'),
    PlansList(
        planName: 'Basic',
        planCode: 'Mont',
        planPrice: '5.0',
        planDetails: 'US / Monthly'),
    PlansList(
        planName: 'Pro',
        planCode: 'Annu',
        planPrice: '35.0',
        planDetails: 'US / Annual'),
    PlansList(
        planName: 'Pro',
        planCode: 'Mont',
        planPrice: '5.0',
        planDetails: 'US / Monthly'),
  ];

  PlansList? selectedPlan;

  @override
  void initState() {
    // TODO: implement initState
    selectedPlan = plans!.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Applying new selected locale on this page
    var localeProvider = Provider.of<LocaleProvider>(context);
    selectedLocaleCode = localeProvider.selectedLocaleCode;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Center(
              child: ClayContainerDesign(
                containerColor: baseColor,
                borderRadius: 10.0,
                customBorderRadius: BorderRadius.circular(20.0),
                curveType: CurveType.none,
                height: 70.0,
                textDetails: 'generalUse-planSubscribe'.tr().toString(),
                clayTextSize: 32.0,
                clayTextColor: Colors.white,
                clayTextColorText: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Card(
              color: Colors.lightGreen,
              elevation: 10.0,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.blue,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              borderOnForeground: true,
              margin: const EdgeInsets.all(3.0),
              clipBehavior: Clip.hardEdge,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5.0),
                color: baseColor,
                constraints: const BoxConstraints(
                  minWidth: 300.0,
                  maxWidth: 300.0,
                  minHeight: 380.0,
                  maxHeight: 380.0,
                ),
                child: Row(
                  children: [
                    //Plans Names
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          //Basic Plan column
                          ClayContainerDesign(
                            containerColor: baseColor,
                            borderRadius: 10,
                            customBorderRadius: BorderRadius.circular(10.0),
                            curveType: CurveType.none,
                            height: 70.0,
                            textDetails:
                                'generalUse-planBasic'.tr().toString(),
                            clayTextSize: 25.0,
                            clayTextColor: Colors.white,
                            clayTextColorText: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'generalUse-trial'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-productDetails'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-companyDetails'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-chatFreeBasicPlan'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-basicAnnualFee'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Text(
                              'generalUse-basicMonthlyFee'.tr().toString(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          //PRO Plan column
                          ClayContainerDesign(
                            containerColor: baseColor,
                            borderRadius: 10,
                            customBorderRadius: BorderRadius.circular(10.0),
                            curveType: CurveType.none,
                            height: 70.0,
                            textDetails: 'generalUse-planPro'.tr().toString(),
                            clayTextSize: 25.0,
                            clayTextColor: Colors.white,
                            clayTextColorText: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'generalUse-trial'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-productDetails'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-companyDetails'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'generalUse-whatsapp'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'generalUse-proAnnualFee'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'generalUse-proMonthlyFee'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 40.0,
              child: Card(
                color: Colors.white,
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.all(3.0),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Seller Plan
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        'generalUse-sellerPlan'.tr().toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    //Select plan from dropdown list
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: DropDown<PlansList>(
                        items: plans!,
                        customWidgets: PlansList().getPlansDetails(),
                        initialValue: plans!.first,
                        onChanged: (lo) {
                          setState(() {
                            selectedPlan = lo;
                          });
                        },
                        isCleared: selectedPlan == null,
                        isExpanded: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5.0),
              color: baseColor,
              constraints: const BoxConstraints(
                minWidth: 300.0,
                maxWidth: 400.0,
                minHeight: 100.0,
                maxHeight: 100.0,
              ),
              child: StandardElevatedButton(
                backgroundBaseColor: Colors.white,
                foregroundBaseColor: Colors.white,
                buttonMinWidth: 110.0,
                buttonMaxWidth: 110.0,
                buttonMinHeight: 60.0,
                buttonMaxHeight: 60.0,
                onHover: (value) {},
                onFocusChanged: (value) {},
                autofocus: false,
                child: Image.asset('assets/images/paypal.jpg'),
                onPressed: () => Navigator.pushNamed(
                  context,
                  PaypalPayment.routeName,
                  arguments: PlanAttributes(
                    sellerPlanNameValue: selectedPlan!.planName,
                    sellerPlanCodeValue: selectedPlan!.planCode,
                    sellerPlanPriceValue: selectedPlan!.planPrice,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}

class PlanAttributes {
  final String? sellerPlanNameValue;
  final String? sellerPlanCodeValue;
  final String? sellerPlanPriceValue;

  PlanAttributes(
      {this.sellerPlanNameValue,
      this.sellerPlanCodeValue,
      this.sellerPlanPriceValue});
}

class PlansList {
  final String? planName;
  final String? planCode;
  final String? planPrice;
  final String? planDetails;
  final int? itemCounts;

  PlansList(
      {this.planName,
      this.planCode,
      this.planPrice,
      this.planDetails,
      this.itemCounts});

  // Add items to the drop down list ..any type of Widget
  List<Widget>? getPlansDetails() {
    return [
      //Select Word
      Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minWidth: 300.0,
          maxWidth: 300.0,
          minHeight: 30.0,
          maxHeight: 40.0,
        ),
        child: const Text('Select'),
      ),
      //Basic Annual
      ContainerStandard(
        alignment: Alignment.center,
        minWidth: 300.0,
        maxWidth: 300.0,
        minHeight: 30.0,
        maxHeight: 40.0,
        padding: const EdgeInsets.all(1.0),
        //color: Colors.white,
        boxBorderColor: Colors.yellowAccent,
        boxBorderRadius: const BorderRadius.all(Radius.circular(10.0)),
        gradientColorOne: Colors.white,
        gradientColorTwo: Colors.white,
        /* image: DecorationImage(
              image:  MemoryImage(sellerShopLogo!),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.fill,
              alignment: Alignment.center,
              centerSlice: Rect.fromLTRB(1.0, 1.0, 1.0, 1.0),
              repeat: ImageRepeat.noRepeat,
              matchTextDirection: false,
            ),*/
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Basic',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                '20.0',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Text(
                'US / Annual',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      //Basic Monthly
      ContainerStandard(
        alignment: Alignment.center,
        minWidth: 300.0,
        maxWidth: 320.0,
        minHeight: 30.0,
        maxHeight: 40.0,
        padding: const EdgeInsets.all(1.0),
        //color: Colors.white,
        boxBorderColor: Colors.yellowAccent,
        boxBorderRadius: const BorderRadius.all(Radius.circular(10.0)),
        gradientColorOne: Colors.white,
        gradientColorTwo: Colors.white,
        /* image: DecorationImage(
              image:  MemoryImage(sellerShopLogo!),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.fill,
              alignment: Alignment.center,
              centerSlice: Rect.fromLTRB(1.0, 1.0, 1.0, 1.0),
              repeat: ImageRepeat.noRepeat,
              matchTextDirection: false,
            ),*/
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Basic',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                '5.0',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Text(
                'US / Monthly',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      //Pro Annual
      ContainerStandard(
        alignment: Alignment.center,
        minWidth: 300.0,
        maxWidth: 300.0,
        minHeight: 30.0,
        maxHeight: 40.0,
        padding: const EdgeInsets.all(1.0),
        //color: Colors.white,
        boxBorderColor: Colors.yellowAccent,
        boxBorderRadius: const BorderRadius.all(Radius.circular(10.0)),
        gradientColorOne: Colors.white,
        gradientColorTwo: Colors.white,
        /* image: DecorationImage(
              image:  MemoryImage(sellerShopLogo!),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.fill,
              alignment: Alignment.center,
              centerSlice: Rect.fromLTRB(1.0, 1.0, 1.0, 1.0),
              repeat: ImageRepeat.noRepeat,
              matchTextDirection: false,
            ),*/
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Pro',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                '35.0',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Text(
                'US / Annual',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      //Pro Monthly
      ContainerStandard(
        alignment: Alignment.center,
        minWidth: 300.0,
        maxWidth: 300.0,
        minHeight: 30.0,
        maxHeight: 40.0,
        padding: const EdgeInsets.all(1.0),
        //color: Colors.white,
        boxBorderColor: Colors.yellowAccent,
        boxBorderRadius: const BorderRadius.all(Radius.circular(10.0)),
        gradientColorOne: Colors.white,
        gradientColorTwo: Colors.white,
        /* image: DecorationImage(
              image:  MemoryImage(sellerShopLogo!),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.fill,
              alignment: Alignment.center,
              centerSlice: Rect.fromLTRB(1.0, 1.0, 1.0, 1.0),
              repeat: ImageRepeat.noRepeat,
              matchTextDirection: false,
            ),*/
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'Pro',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                '5.0',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Text(
                'US / Monthly',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
