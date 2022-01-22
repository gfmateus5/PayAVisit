import 'dart:async';
import 'dart:math';
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

  List<String> _likedSpots = [];
  List<SpotDetails> _closestSpots = [];
  double distance;

  StreamSubscription<Position> positionStream;
  GoogleMapController _mapsController;
  final markers = Set<Marker>();
  Uint8List _iconSpots, _iconStores, _iconEvents;

  static PayAVisitController get to => Get.find<PayAVisitController>();
  get mapsController => _mapsController;

  QuerySnapshot<Map<String, dynamic>> get spots => _spots;
  QuerySnapshot<Map<String, dynamic>> get stores => _stores;
  QuerySnapshot<Map<String, dynamic>> get events => _events;
  List<String> get likedSpots => _likedSpots;

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
    _spots.docs.forEach(
        (spot) => addMarker(spot, _iconSpots, showSpotDetails(spot.data())));
  }

  loadSpots() async {
    _iconSpots = await getBytesFromAsset('assets/spot-ic.png', 64);
    _spots = await DB.get().collection('spots_skr').get();
    _spots.docs.forEach((spot) async {
      addMarker(spot, _iconSpots, showSpotDetails(spot.data()));
      distance = await calculateDistance(spot.data()['position']['geopoint']);
      _closestSpots.add(SpotDetails(spot: spot.data(), distance: distance));
    });
  }

  showSpotDetails(spot) async {
    distance = await calculateDistance(spot['position']['geopoint']);
    return SpotDetails(spot: spot, distance: distance);;
  }

  closestSpots(){
    _closestSpots.sort((a, b) => a.distance.compareTo(b.distance));
    return _closestSpots;
  }

  // ----------------------------- Stores --------------------------------

  filterStores() async {
    removeMarkers();
    _stores.docs.forEach((store) =>
        addMarker(store, _iconStores, showStoreDetails(store.data())));
  }

  loadStores() async {
    _iconStores = await getBytesFromAsset('assets/store-ic.png', 64);
    _stores = await DB.get().collection('stores_skr').get();
    _stores.docs.forEach((store) =>
        addMarker(store, _iconStores, showStoreDetails(store.data())));
  }

  showStoreDetails(store) async {
    distance = await calculateDistance(store['position']['geopoint']);
    return StoreDetails(
        name: store['name'],
        image: store['image'],
        distance: distance,
        rating: store['rating'],
        description: store['description'],
        type: store['type'],
        price: store['price']);
  }

  // ----------------------------- Events --------------------------------

  filterEvents() async {
    removeMarkers();
    _events.docs.forEach((event) =>
        addMarker(event, _iconEvents, showEventDetails(event.data())));
  }

  loadEvents() async {
    _iconEvents = await getBytesFromAsset('assets/event-ic.png', 64);
    _events = await DB.get().collection('events_test2').get();
    _events.docs.forEach((event) =>
        addMarker(event, _iconEvents, showEventDetails(event.data())));
  }

  showEventDetails(event) async {
    distance = await calculateDistance(event['position']['geopoint']);
    return EventDetails(
      name: event['name'],
      image: event['image'],
      distance: distance,
      description: event['description'],
      date: event['date'],
      time: event['time'],
      duration: event['duration'],
      by: event['by']
    );
  }

  // ----------------------------- Markers --------------------------------

  displayMarkers() {
    _stores.docs.forEach((store) =>
        addMarker(store, _iconStores, showStoreDetails(store.data())));
    _events.docs.forEach((event) =>
        addMarker(event, _iconEvents, showEventDetails(event.data())));
    _spots.docs.forEach(
        (spot) => addMarker(spot, _iconSpots, showSpotDetails(spot.data())));
  }

  removeMarkers() {
    markers.clear();
    update();
  }

  addMarker(spot, icon, widget) async {
    GeoPoint point = spot.get('position.geopoint');
    print(spot.get('name'));

    markers.add(
      Marker(
        markerId: MarkerId(spot.id),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: spot.get('name')),
        icon: BitmapDescriptor.fromBytes(icon),
        onTap: () async => Get.dialog(await widget),
      ),
    );
    update();
  }

  // ------------------------------ Aux ---------------------------------

  static Future<double> calculateDistance(spot_position) async {
    var currentPosition = await Geolocator.getCurrentPosition();
    var p = 0.017453292519943295;
    var c = cos;
    var lat1 = currentPosition.latitude;
    var lon1 = currentPosition.longitude;
    var lat2 = spot_position.latitude;
    var lon2 = spot_position.longitude;

    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
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

  Future<Position> getCurrentPosition() async {
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

    return Geolocator.getCurrentPosition();
  }

  getPosition() async {
    try {
      final position = await getCurrentPosition();
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
