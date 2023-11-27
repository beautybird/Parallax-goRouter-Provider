import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:myandroidapp/src/map/search_address.dart';
import 'package:provider/provider.dart';
import 'package:latlng/latlng.dart';

class MapDesign extends StatefulWidget {
  const MapDesign({Key? key}) : super(key: key);

  @override
  _MapDesignState createState() => _MapDesignState();
}

class _MapDesignState extends State<MapDesign> {
  double? latitudeValue;
  double? longitudeValue;

  _MapDesignState();

  //Create Map controller with default LatLng values
  // MapController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
/*

  void _onDoubleTap() {
    controller!.zoom += 0.5;
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller!.zoom += 0.02;
    } else if (scaleDiff < 0) {
      controller!.zoom -= 0.02;
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      controller!.drag(diff.dx, diff.dy);
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    //From provider we get te lat and lng values
    var addressProvider = Provider.of<SearchAddressProvider>(context);
    // If we not get the lat, lng values ..we set default values
    latitudeValue = (addressProvider.addressResultList!.elementAt(2) ?? 3.139);
    longitudeValue = (addressProvider.addressResultList!.elementAt(3) ?? 101.6869);

    return GestureDetector(
      // onDoubleTap: _onDoubleTap,
      // onScaleStart: _onScaleStart,
      // onScaleUpdate: _onScaleUpdate,
      // onScaleEnd: (details) {},
      child: Stack(
        children: [
          Map(
            controller: MapController(
              location: LatLng(latitudeValue!, longitudeValue!),
            ),
            builder: (context, x, y, z) {
              final url =
                  'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

              return CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
              );
            },
          ),
          const Center(
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
