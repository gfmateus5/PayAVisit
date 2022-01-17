import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/widgets/spots/spot_details.dart';

class RoutesPage extends StatefulWidget {
  final String name;
  final List<String> spots;

  const RoutesPage({Key key, this.name, this.spots}) : super(key: key);

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  List<Map<String, dynamic>> filteredSpots = [];

  filterSpots() {
    PayAVisitController.to.spots.docs.forEach((spot) => {
          if (widget.spots.contains(spot["name"]))
            filteredSpots.add(spot.data())
        });
  }

  @override
  void initState() {
    filterSpots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 55,
          title: Text(widget.name,
              style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: new AssetImage('assets/login_background.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredSpots.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                          margin: EdgeInsets.all(15),
                          height: 200,
                          child: InkWell(
                              onTap: () async {
                                var distance =
                                    await PayAVisitController.calculateDistance(
                                        filteredSpots.elementAt(
                                            index)['position']['geopoint']);

                                showDialog(
                                    context: context,
                                    builder: (context) => SpotDetails(
                                        spot: filteredSpots.elementAt(index),
                                        distance: distance));
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned.fill(
                                      //guarantees the image fills the stack area
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        filteredSpots.elementAt(index)["image"],
                                        fit: BoxFit.cover),
                                  )),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 170,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black.withOpacity(0.3),
                                                  Colors.transparent
                                                ])),
                                      )),
                                  Positioned(
                                    bottom: 13.5,
                                    left: 25,
                                    right: 25,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.black.withOpacity(0.3),
                                                Colors.black.withOpacity(0.4)
                                              ])),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 280,
                                    right: 10,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.black.withOpacity(0.3),
                                                Colors.black.withOpacity(0.4)
                                              ])),
                                      child: Row(
                                        children: [
                                          Text(
                                            '  ' +
                                                filteredSpots
                                                    .elementAt(index)["coins"],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          Icon(
                                            Icons.attach_money,
                                            size: 30,
                                            color: Colors.amber,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: Row(
                                        children: [
                                          Text(
                                            filteredSpots
                                                .elementAt(index)["name"],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )));
                    },
                  ),
                )
              ],
            )));
  }
}
