import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/pages/add_spot_page.dart';
import 'package:flutter_google_maps_exemplo/pages/route_page.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../contract_linking.dart';

class PayAVisitPage extends StatefulWidget {
  const PayAVisitPage({Key key}) : super(key: key);

  @override
  State<PayAVisitPage> createState() => _PayAVisitPageState();
}

class _PayAVisitPageState extends State<PayAVisitPage> {
  int _selectedIndex = -1;
  bool _isFiltered = false;

  int balance;
  RxDouble moneyToSpend;

  var contractLink;

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
        Text('\$${balance}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber,
                fontSize: 40,
                fontWeight: FontWeight.bold)),
        Obx(
          () => Slider(
              value: moneyToSpend.value,
              min: 0,
              max: balance.toDouble(),
              divisions: balance,
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
                contractLink.writeContract(contractLink.payAmount, [BigInt.from(moneyToSpend.value)]);
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
    contractLink = Provider.of<ContractLinking>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PayAVisit'),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () async {
              var result = await contractLink.readContract(contractLink.getBalanceAmount, []);
              balance = result?.first?.toInt();
              moneyToSpend = balance.toDouble().obs;
              showDialog(context: context, builder: (context) => pay());
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () async {
            var result = await contractLink.readContract(contractLink.getBalanceAmount, []);
            balance = result?.first?.toInt();
            moneyToSpend = balance.toDouble().obs;
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
                zoomControlsEnabled: false,
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      controller.latitude.value, controller.longitude.value),
                  zoom: 13,
                ),
                myLocationEnabled: true,
                markers: controller.markers,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          //width: double.infinity,
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddSpotPage()),
            ),
            child: Icon(Icons.add, color: Colors.black),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shadowColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                shape: MaterialStateProperty.all(const CircleBorder())),
          ),
        ),
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
                      color:
                          _selectedIndex == 2 ? Colors.purple : Colors.white),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                Text('Events',
                    style: TextStyle(
                        color: _selectedIndex == 2
                            ? Colors.purple
                            : Colors.white)),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoutePage()),
                    );
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
    );
  }
}
