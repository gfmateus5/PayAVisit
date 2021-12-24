import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Location {
  BitmapDescriptor icon;
  filter();
  load();
  customMarker();
}