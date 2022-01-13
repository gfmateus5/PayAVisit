import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps_exemplo/database/db.dart';
import 'package:flutter_google_maps_exemplo/widgets/events/event_details.dart';
import 'package:flutter_google_maps_exemplo/widgets/spots/spot_details.dart';
import 'package:flutter_google_maps_exemplo/widgets/stores/store_details.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PayAVisitController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  QuerySnapshot<Map<String, dynamic>> _spots;
  QuerySnapshot<Map<String, dynamic>> _stores;
  QuerySnapshot<Map<String, dynamic>> _events;

  StreamSubscription<Position> positionStream;
  GoogleMapController _mapsController;
  final markers = Set<Marker>();
  Uint8List _iconSpots, _iconStores, _iconEvents;

  static PayAVisitController get to => Get.find<PayAVisitController>();
  get mapsController => _mapsController;

  QuerySnapshot<Map<String, dynamic>> get spots => _spots;
  QuerySnapshot<Map<String, dynamic>> get stores => _stores;
  QuerySnapshot<Map<String, dynamic>> get events => _events;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosition();
    //DB.setupDemoData();
    loadSpots();
    loadStores();
    loadEvents();

    var style = await rootBundle.loadString('assets/map/dark.json');
    _mapsController.setMapStyle(style);
  }

  // ----------------------------- Spots --------------------------------

  filterSpots() async {
    removeMarkers();
    _spots.docs.forEach((spot) => addMarker(spot, _iconSpots, 'spot'));
  }

  loadSpots() async {
    _iconSpots = await getBytesFromAsset('assets/spot-ic.png', 64);
    _spots = await  DB.get().collection('spots_skr').get();
    _spots.docs.forEach((spot) => addMarker(spot, _iconSpots, 'spot'));
  }

  // ----------------------------- Stores --------------------------------

  filterStores() async {
    removeMarkers();
    _stores.docs.forEach((store) => addMarker(store, _iconStores, 'store'));
  }

  loadStores() async {
    _iconStores = await getBytesFromAsset('assets/store-ic.png', 64);
    _stores = await DB.get().collection('stores_test2').get();
    _stores.docs.forEach((store) => addMarker(store, _iconStores, 'store'));
  }

  // ----------------------------- Events --------------------------------

  filterEvents() async {
    removeMarkers();
    _events.docs.forEach((event) => addMarker(event, _iconEvents, 'event'));
  }

  loadEvents() async {
    _iconEvents = await getBytesFromAsset('assets/event-ic.png', 64);
    _events = await DB.get().collection('events_test2').get();
    _events.docs.forEach((event) => addMarker(event, _iconEvents, 'event'));
  }

  // ----------------------------- Markers --------------------------------

  displayMarkers() {
    _stores.docs.forEach((store) => addMarker(store, _iconStores, 'store'));
    _events.docs.forEach((event) => addMarker(event, _iconEvents, 'event'));
    _spots.docs.forEach((spot) => addMarker(spot, _iconSpots, 'spot'));
  }

  removeMarkers() {
    markers.clear();
    update();
  }

  addMarker(spot, icon, type) async {
    GeoPoint point = spot.get('position.geopoint');
    print(spot.get('name'));

    markers.add(
      Marker(
        markerId: MarkerId(spot.id),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: spot.get('name')),
        icon: BitmapDescriptor.fromBytes(icon),
        onTap: () => showDetails(spot.data(), type),
      ),
    );
    update();
  }

  // ------------------------------ Aux ---------------------------------

  showDetails(spot, type) {
    switch(type) {
      case 'spot':
        Get.bottomSheet(
          SpotDetails(
            name: spot['name'],
            image: spot['image'],
          ),
          barrierColor: Colors.transparent,
        );
        break;
      case 'event':
        Get.bottomSheet(
          EventDetails(
            name: spot['name'],
            image: spot['image'],
          ),
          barrierColor: Colors.transparent,
        );
        break;
      case 'store':
        Get.bottomSheet(
          StoreDetails(
            name: spot['name'],
            image: spot['image'],
          ),
          barrierColor: Colors.transparent,
        );
        break;
    }

  }

  watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      if (position != null) {
        latitude.value = position.latitude;
        longitude.value = position.longitude;
      }
    });
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;
    bool enabled = await Geolocator.isLocationServiceEnabled();

    if (!enabled) {
      return Future.error('Please, activate the smartphone location.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('You need to authorize the location access.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'You need to authorize the location access in smartphone settings.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosition() async {
    try {
      final position = await _currentPosition();
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      _mapsController.animateCamera(
          CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)));
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
