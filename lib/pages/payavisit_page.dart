import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PayAVisitPage extends StatefulWidget {
  const PayAVisitPage({Key key}) : super(key: key);

  @override
  State<PayAVisitPage> createState() => _PayAVisitPageState();
}

class _PayAVisitPageState extends State<PayAVisitPage> {
  int _selectedIndex = -1;
  bool _isFiltered = false;

  RxDouble currentBalance = 5.0.obs;
  RxDouble moneyToSpend = 5.0.obs;

  void _onItemTapped(index) {
    // handles the 4 bottomBar buttons
    if (_selectedIndex == index && _isFiltered) {
      PayAVisitController.to.displayMarkers();
      setState(() {
        _isFiltered = false;
        _selectedIndex = -1;
      });
    } else {
      setState(() {
        _selectedIndex = index;
        _isFiltered = true;
      });

      if (_selectedIndex == 0) {
        PayAVisitController.to.filterSpots();
      } else if (_selectedIndex == 1) {
        PayAVisitController.to.filterStores();
      } else if (_selectedIndex == 2) {
        PayAVisitController.to.filterEvents();
      } else if (_selectedIndex == 3) {
        // TODO
      }
    }
  }

  pay() {
    return SimpleDialog(
      backgroundColor: Colors.black,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.amber,
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Icons.person, color: Colors.black),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                    ),
                  ),
                  TextSpan(
                    text: 'Dinis "A Pedra"',
                  )
                ],
              ),
            ),
          ]),
          Column(children: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: Icon(Icons.close, color: Colors.black),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(const CircleBorder())),
            )
          ]),
        ]),
        Text('\n\nCurrent Balance',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.amber, fontSize: 20)),
        Text('\$${currentBalance.value}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber,
                fontSize: 40,
                fontWeight: FontWeight.bold)),
        Obx(
          () => Slider(
              value: moneyToSpend.value,
              min: 0,
              max: currentBalance.value,
              divisions: (currentBalance.value * 2.0).toInt(),
              label: moneyToSpend.value.toString(),
              onChanged: (value) {
                setState(() {
                  moneyToSpend.value = value;
                });
              }),
        ),
        Divider(),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                currentBalance.value -= moneyToSpend.value;
                moneyToSpend.value = currentBalance.value; // reset
                Get.back();
              },
              child: Text('PAY', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PayAVisitController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PayAVisit'),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              showDialog(context: context, builder: (context) => pay());
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            showDialog(context: context, builder: (context) => pay());
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<PayAVisitController>(
              init: controller,
              builder: (value) => GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: controller.position,
                  zoom: 13,
                ),
                onMapCreated: controller.onMapCreated,
                myLocationEnabled: true,
                markers: controller.markers,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(maxHeight: 30),
                  icon: Icon(Icons.location_on,
                      color: _selectedIndex == 0 ? Colors.amber : Colors.white),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
                Text('Spots',
                    style: TextStyle(
                        color:
                            _selectedIndex == 0 ? Colors.amber : Colors.white)),
                Text('', style: TextStyle(fontSize: 5)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(maxHeight: 30),
                  icon: Icon(Icons.coffee,
                      color: _selectedIndex == 1 ? Colors.blue : Colors.white),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
                Text('Stores',
                    style: TextStyle(
                        color:
                            _selectedIndex == 1 ? Colors.blue : Colors.white)),
                Text('', style: TextStyle(fontSize: 5)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(maxHeight: 30),
                  icon: Icon(Icons.theater_comedy,
                      color: _selectedIndex == 2 ? Colors.pink : Colors.white),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                Text('Events',
                    style: TextStyle(
                        color:
                            _selectedIndex == 2 ? Colors.pink : Colors.white)),
                Text('', style: TextStyle(fontSize: 5)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(maxHeight: 30),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                  icon: Icon(Icons.alt_route_outlined,
                      color: _selectedIndex == 3 ? Colors.red : Colors.white),
                ),
                Text('Routes',
                    style: TextStyle(
                        color:
                            _selectedIndex == 3 ? Colors.red : Colors.white)),
                Text('', style: TextStyle(fontSize: 5)),
              ],
            )
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Spots',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Stores',
           // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy),
            label: 'Events',
            //backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alt_route_outlined),
            label: 'Routes',
            //backgroundColor: Colors.black,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: _onItemTapped(_selectedIndex),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),*/
    );
  }
}
