import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductsImagesGridView extends StatelessWidget {
  final File? imageFile;
  final Image? image;
  final IconData? iconGallery;
  final IconData? iconCamera;
  final IconData? iconRemove;
  final TextEditingController? videoController;
  final Function()? onPressedGallery;
  final Function()? onPressedCamera;
  final Function()? onPressedRemove;
  final bool galleryButtonClicked = false;
  final bool cameraButtonClicked = false;
  final bool removeImageClicked = false;

  ProductsImagesGridView({
    this.imageFile,
    this.image,
    this.iconGallery,
    this.iconCamera,
    this.iconRemove,
    this.videoController,
    this.onPressedGallery,
    this.onPressedCamera,
    this.onPressedRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          scrollDirection: Axis.vertical,
          reverse: false,
          controller: ScrollController(
            initialScrollOffset: 0,
            keepScrollOffset: true,
            debugLabel: 'userAccount_Grid',
          ),
          primary: false,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 0.0),
          addAutomaticKeepAlives: true,
          addRepaintBoundaries: true,
          addSemanticIndexes: true,
          crossAxisCount: 4,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 20.0,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2.0),
              //height: 70.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              alignment: Alignment.center,
              child: imageFile == null
                  ? Text(
                      'generalUse-noImageSelected'.tr().toString(),
                    )
                  : Image.file(imageFile!),
            ),
            SizedBox.fromSize(
              size: Size(40, 40), // button width and height
              child: ClipOval(
                child: Material(
                  shadowColor: Colors.grey,
                  elevation: 10.0,
                  color: Colors.white,
                  //color: Color.fromRGBO(0, 160, 227, 1), // button color
                  child: InkWell(
                    splashColor: Color.fromRGBO(248, 177, 1, 1),
                    // splash color
                    onTap:onPressedRemove,
                    // button pressed
                    child: Icon(
                      iconRemove,
                      color: Color.fromRGBO(0, 160, 227, 1),
                      size: 35.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: Size(40, 40), // button width and height
              child: ClipOval(
                child: Material(
                  shadowColor: Colors.grey,
                  elevation: 10.0,
                  color: Colors.white,
                  //color: Color.fromRGBO(0, 160, 227, 1), // button color
                  child: InkWell(
                    splashColor: Color.fromRGBO(248, 177, 1, 1),
                    // splash color
                    onTap:onPressedCamera,
                    // button pressed
                    child: Icon(
                      iconCamera,
                      color: Color.fromRGBO(0, 160, 227, 1),
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: Size(40, 40), // button width and height
              child: ClipOval(
                child: Material(
                  shadowColor: Colors.grey,
                  elevation: 10.0,
                  color: Colors.white,
                  //color: Color.fromRGBO(0, 160, 227, 1), // button color
                  child: InkWell(
                    splashColor: Color.fromRGBO(248, 177, 1, 1),
                    // splash color
                    onTap:onPressedGallery,
                    // button pressed
                    child: Icon(
                      iconGallery,
                      color: Color.fromRGBO(0, 160, 227, 1),
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ),
            /*StandardElevatedButton(
              backgroundBaseColor:
              removeImageClicked == false
                  ? Colors.white
                  : Colors.blue.shade200,
              foregroundBaseColor: Colors.white,
              buttonMinWidth: 40.0,
              buttonMaxWidth: 40.0,
              buttonMinHeight: 40.0,
              buttonMaxHeight: 40.0,
              autofocus: false,
              buttonShape:
              MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(
                  side: BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              elevation: 10.0,
              padding: 3.0,
              shadowColor: Colors.grey,
              onHover: (value) {},
              onFocusChanged: (value) {},
              child: Icon(
                iconRemove,
                size: 30,
                color: Colors.teal,
                semanticLabel: 'userAccountRemoveImage',
              ),
              onPressed: onPressedRemove!,
            ),*/
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
