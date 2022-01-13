import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Location {
  BitmapDescriptor icon;
  String name;
  String description;
  String image;
  double latitude;
  double longitude;
  double rating;

  filter();
  load();
  customMarker();
}