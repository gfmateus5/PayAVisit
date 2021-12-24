import 'package:flutter/cupertino.dart';
import 'package:flutter_google_maps_exemplo/domain/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Spot extends Location {
  BitmapDescriptor icon;

  @override
  filter() {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  load() {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  customMarker() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/spot-ic.png').
    then((value) => {
      icon = value
    });
  }

}