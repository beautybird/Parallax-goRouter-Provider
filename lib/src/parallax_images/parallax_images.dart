

import 'package:flutter/material.dart';
import 'package:myandroidapp/src/parallax_images/location.dart';
import 'package:myandroidapp/src/parallax_images/parallax_images_list.dart';
import 'package:myandroidapp/src/settings/settings_controller.dart';


class ParallaxImages extends StatelessWidget {

  static const routeName="/parallaxImages";
  final SettingsController? controller;

  const ParallaxImages({Key? key,this.controller}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:  [
          for (final location in locations)
            ParallaxImagesListItem(
              imageAsset: location.imageAsset,
              imageUrl: location.imageUrl,
              name: location.name,
              country: location.place,
            ),
        ],
      ),
    );
  }
}