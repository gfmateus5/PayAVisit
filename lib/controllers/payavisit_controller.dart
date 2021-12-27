import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps_exemplo/database/db.dart';
import 'package:flutter_google_maps_exemplo/widgets/event_details.dart';
import 'package:flutter_google_maps_exemplo/widgets/spot_details.dart';
import 'package:flutter_google_maps_exemplo/widgets/store_details.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PayAVisitController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final radius = 0.0.obs;

  QuerySnapshot<Map<String, dynamic>> _spots;
  QuerySnapshot<Map<String, dynamic>> _stores;
  QuerySnapshot<Map<String, dynamic>> _events;

  StreamSubscription<Position> positionStream;
  LatLng _position = LatLng(38.7450825782112, -9.14634367248467);
  GoogleMapController _mapsController;
  final markers = Set<Marker>();
  Uint8List _iconSpots, _iconStores, _iconEvents;

  static PayAVisitController get to => Get.find<PayAVisitController>();
  get mapsController => _mapsController;
  get position => _position;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  /*filterSpots() {
    final geo = Geoflutterfire();
    final db = DB.get();

    GeoFirePoint center = geo.point(
      latitude: latitude.value,
      longitude: longitude.value,
    );

    CollectionReference ref = db.collection('spots');

    String field = 'position';

    Stream<List<DocumentSnapshot>> stream =
        geo.collection(collectionRef: ref).within(center: center, radius: radius.value, field: field);

    stream.listen((List<DocumentSnapshot> spots) {
      markers.clear();
      spots.forEach((spot) {
        addMarker(spot, 'spot');
        update();
      });
      Get.back();
    });
  }*/

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

  displayMarkers() {
    _stores.docs.forEach((store) => addMarker(store, _iconStores, 'store'));
    _events.docs.forEach((event) => addMarker(event, _iconEvents, 'event'));
    _spots.docs.forEach((spot) => addMarker(spot, _iconSpots, 'spot'));
  }

  filterSpots() async {
    removeMarkers();
    _spots.docs.forEach((spot) => addMarker(spot, _iconSpots, 'spot'));
  }

  loadSpots() async {
    _iconSpots = await getBytesFromAsset('assets/spot-ic.png', 64);
    FirebaseFirestore db = DB.get();
    _spots = await db.collection('spots_test2').get();
    _spots.docs.forEach((spot) => addMarker(spot, _iconSpots, 'spot'));
  }

  filterStores() async {
    removeMarkers();
    _stores.docs.forEach((store) => addMarker(store, _iconStores, 'store'));
  }

  loadStores() async {
    _iconStores = await getBytesFromAsset('assets/store-ic.png', 64);
    FirebaseFirestore db = DB.get();
    _stores = await db.collection('stores_test2').get();
    _stores.docs.forEach((store) => addMarker(store, _iconStores, 'store'));
  }

  filterEvents() async {
    removeMarkers();
    _events.docs.forEach((event) => addMarker(event, _iconEvents, 'event'));
  }

  loadEvents() async {
    _iconEvents = await getBytesFromAsset('assets/event-ic.png', 64);
    FirebaseFirestore db = DB.get();
    _events = await db.collection('events_test2').get();
    _events.docs.forEach((event) => addMarker(event, _iconEvents, 'event'));
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
