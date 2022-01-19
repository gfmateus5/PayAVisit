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
          title: Text(widget.name, style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.redAccent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            ),
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
                        margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 4,
                            color: Colors.grey.shade600
                          ),
                          image: DecorationImage(
                            image: NetworkImage(filteredSpots.elementAt(index)["image"]),
                            fit: BoxFit.cover
                          )
                        ),
                        child: InkWell(
                            onTap: () async {
                              var distance = await PayAVisitController.calculateDistance(filteredSpots.elementAt(index)['position']['geopoint']);
                              showDialog(context: context, builder: (context) => SpotDetails(spot: filteredSpots.elementAt(index), distance: distance));
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.3),
                                        Colors.transparent
                                      ]
                                    )
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 350,
                                  margin: EdgeInsets.only(top: 120),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.black.withOpacity(0.1),
                                          Colors.black.withOpacity(0.3)
                                        ]
                                    ),
                                  ),
                                  child: Text(filteredSpots.elementAt(index)["name"], textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  margin: EdgeInsets.only(bottom: 127, left: 250),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.black.withOpacity(0.3),
                                        Colors.black.withOpacity(0.4)
                                      ]
                                    ),
                                    /*border: Border.all(
                                        width: 3,
                                        color: Colors.grey.shade900
                                    )*/
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('  ' + filteredSpots.elementAt(index)["coins"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.attach_money,
                                        size: 30,
                                        color: Colors.amber,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                    );
                  },
                ),
              )
            ],
          )
      )
    );
  }
}
