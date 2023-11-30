import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myandroidapp/src/models/models.dart';
import 'package:myandroidapp/src/parallax/card_provider.dart';
import 'package:myandroidapp/src/parallax/images_card.dart';
import 'package:myandroidapp/src/parallax/media_assets.dart';
import 'package:myandroidapp/src/products/products_search_provider.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';
import 'package:myandroidapp/src/shared_widgets/buttons.dart';
import 'package:provider/provider.dart';

class Cards extends StatefulWidget {
  static const routeName = "/cardsRoute";
  final SettingsController? controller;
  final String? label;

  const Cards({super.key, this.controller, this.label});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late PageController? _pageController;

  //
  CardProvider? cardProvider;
  //
  ProductsSearchProvider? productsSearchProvider;
  //
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    cardProvider = Provider.of<CardProvider>(context);
    //
    productsSearchProvider = Provider.of<ProductsSearchProvider>(context);
    //
    double? height = MediaQuery.of(context).size.height;
    //
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: height * 0.82,
            child: PageView.builder(
              controller: _pageController,
              itemCount: MediaAssets.images.length,
              reverse: false,
              itemBuilder: (context, index) {
                return StandardElevatedButton(
                  autofocus: false,
                  buttonMinWidth: double.maxFinite,
                  buttonMaxWidth: double.maxFinite,
                  buttonMinHeight: height * 0.82,
                  buttonMaxHeight: height * 0.82,
                  backgroundBaseColor: Colors.white,
                  foregroundBaseColor: Colors.white,
                  buttonShape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  elevation: 15.0,
                  padding: 0.0,
                  shadowColor: Colors.grey,
                  onFocusChanged: (value) {},
                  onHover: (value) {},
                  child: Stack(
                    children: [
                      ImagesCard(),
                      Positioned(
                        left: 100.0,
                        width: 130.0,
                        top: 600.0,
                        height: 70.0,
                        child: categoryTextColor(index)!,
                      ),
                    ],
                  ),
                  onPressed: () async {
                    ///When any image clicked...will redirect to corresponding
                    ///category page
                    if (cardProvider!.category == null ||
                        cardProvider!.category!.isEmpty ||
                        cardProvider!.category!.contains('First')) {
                      //
                      Models()
                          .fetch('First')!
                          .then((productsSearchFuture) {
                        if (productsSearchFuture!.isNotEmpty) {
                          ///We empty the content of the provider from previous searches
                          productsSearchProvider!.setProductsSearchList([]);

                          ///We load the result of the new search
                          productsSearchProvider!
                              .setProductsSearchList(productsSearchFuture);
                          context.go('/a/firstRoute');
                        } else {
                          productsSearchProvider!.setProductsSearchList([]);
                          context.go('/a/noProductsRoute');
                        }
                      }).onError((error, stackTrace) {
                        //since we have no DB connection, so we temporarlly
                        //navigate to firstRoute
                        setState(() {
                          context.go('/a/firstRoute');
                        });
                        /*setState(() {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            title: 'generalUse-sorry'.tr().toString(),
                            titleColor: Colors.red,
                            titleSize: 20.0,
                            message: 'error'.tr().toString(),
                            messageColor: Colors.black,
                            messageSize: 16.0,
                            messageText: Text('error'.tr().toString()),
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
                        });*/
                      }).whenComplete(() => null);
                    } else {
                      //
                      Models()
                          .fetch(cardProvider!.category)!
                          .then((productsSearchFuture) {
                        if (productsSearchFuture!.isNotEmpty) {
                          ///We empty the content of the provider from previous searches
                          productsSearchProvider!.setProductsSearchList([]);

                          ///We load the result of the new search
                          productsSearchProvider!
                              .setProductsSearchList(productsSearchFuture);
                          if (cardProvider!.category!.contains('Second')) {
                            context.go('/a/secondRoute');
                          } else {
                            context.go('/a/thirdRoute');
                          }
                        } else {
                          productsSearchProvider!.setProductsSearchList([]);
                          context.go('/a/noProductsRoute');
                        }
                      }).onError((error, stackTrace) {
                        //
                        setState(() {
                          context.go('/a/secondRoute');
                        });
                        /*setState(() {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            title: 'generalUse-sorry'.tr().toString(),
                            titleColor: Colors.red,
                            titleSize: 20.0,
                            message: 'error'.tr().toString(),
                            messageColor: Colors.black,
                            messageSize: 16.0,
                            messageText: Text('error'.tr().toString()),
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
                        });*/
                      }).whenComplete(() => null);
                    }
                  },
                );
              },
              onPageChanged: (i) {
                cardProvider!.setMediaIndex(i);
                cardProvider!.setAssetPath(MediaAssets.images[i]);
                cardProvider!.setIsSelected(true);
                cardProvider!.setCategory('');
                cardProvider!.setCategory(MediaAssets.categories[i]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget? categoryColor;
  Widget? categoryTextColor(int? index) {
    if (index == 2) {
      return AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            MediaAssets.categories[index!],
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      return AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            MediaAssets.categories[index!],
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }
}
