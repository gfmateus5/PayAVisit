import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_google_maps_exemplo/constants/routes.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/pages/add_spot_page.dart';
import 'package:flutter_google_maps_exemplo/widgets/list_builder.dart';
import 'package:flutter_google_maps_exemplo/widgets/nav_bar.dart';
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 6,
          )
      ),
      backgroundColor: Colors.grey.shade900,
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
                      child: Icon(Icons.person, color: Colors.white),
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
              child: Icon(Icons.close, color: Colors.white),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(const CircleBorder())),
            )
          ]),
        ]),
        SizedBox(height: 30),
        Text('Current Balance',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.amber, fontSize: 20)),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${balance} ', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 40, fontWeight: FontWeight.bold)),
            Icon(Icons.run_circle, size: 35, color: Colors.amber)
          ],
        ),
        Obx(
          () => Slider(
          value: moneyToSpend.value,
          min: 0,
          max: balance.toDouble(),
          divisions: balance == 0 ? 1 : balance~/5,
          label: moneyToSpend.value.toString(),
          onChanged: (value) {
            setState(() {
              moneyToSpend.value = value;
            });
          }),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                showDialog(context: context, builder: (context) => pay_verification());
              },
              child: Container(
                height: 40,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text('PAY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white), textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }

  pay_verification() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      side: BorderSide(
      color: Colors.grey.shade800,
      width: 6,
      )
      ),
      backgroundColor: Colors.grey.shade900,
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scan QR Code to pay ' + moneyToSpend.value.toString() + ' ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Icon(Icons.run_circle, size: 22, color: Colors.white)
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10, right: 25, left: 25),
          height: 200,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/2/2f/Rickrolling_QR_code.png'),
              fit: BoxFit.fitHeight
            )
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.amber
              ),
              child: InkWell(
                onTap: () async {
                  await contractLink.writeContract(contractLink.payAmount, [BigInt.from(moneyToSpend.value)]);
                  var result = await contractLink.readContract(contractLink.getBalanceAmount, []);
                  balance = result?.first?.toInt();
                  Navigator.pop(context);
                },
                child: Text('FINISH', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ),
            )
          ],
        ),
        SizedBox(height: 15)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PayAVisitController());
    contractLink = Provider.of<ContractLinking>(context);

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: Image.asset('assets/payavisit_cut.png', width: 150),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money, color: Colors.white),
            onPressed: () async {
              var result = await contractLink
                  .readContract(contractLink.getBalanceAmount, []);
              balance = result?.first?.toInt();
              moneyToSpend = balance.toDouble().obs;
              showDialog(context: context, builder: (context) => pay());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<PayAVisitController>(
              init: controller,
              builder: (value) => GoogleMap(
                mapType: MapType.normal,
                mapToolbarEnabled: false,
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
          color: Colors.grey.shade900,
          child: Wrap(children: [
            // Expanded(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: Colors.amber),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: Colors.blue),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: Colors.purple),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.bottomCenter,
                      constraints: BoxConstraints(maxHeight: 30),
                      icon: Icon(Icons.location_on,
                          color: _selectedIndex == 0
                              ? Colors.amber
                              : Colors.white),
                      onPressed: () {
                        _onItemTapped(0);
                      },
                    ),
                    Text('Spots',
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.amber
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
                      icon: Icon(Icons.coffee,
                          color:
                              _selectedIndex == 1 ? Colors.blue : Colors.white),
                      onPressed: () {
                        _onItemTapped(1);
                      },
                    ),
                    Text('Stores',
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.blue
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
                      icon: Icon(Icons.theater_comedy,
                          color: _selectedIndex == 2
                              ? Colors.purple
                              : Colors.white),
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
                          MaterialPageRoute(
                              builder: (context) => ListBuilder(
                                  title: "Types of Routes", list: route_types)),
                        );
                      },
                      icon: Icon(Icons.alt_route_outlined,
                          color:
                              _selectedIndex == 3 ? Colors.red : Colors.white),
                    ),
                    Text('Routes',
                        style: TextStyle(
                            color: _selectedIndex == 3
                                ? Colors.red
                                : Colors.white)),
                    Text('', style: TextStyle(fontSize: 5)),
                  ],
                )
              ],
            ),
          ])),
    );
  }
}
