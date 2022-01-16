import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/most_famous_spots.dart';
import 'package:flutter_google_maps_exemplo/pages/quick_routes_page.dart';

import 'historic_routes_page.dart';
class RoutePage extends StatefulWidget {
  @override
  _RoutePage createState() => _RoutePage();
}
class Route {
  String icon;
  String text;
  String url;

  Route({this.icon, this.text, this.url});
}
class _RoutePage extends State<RoutePage> {

  List<Route> routes = [
    Route(icon: 'mostfamousspots.png', text: 'Most Famous Spots', url: 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2018/06/19182104/svetlana-gumerova-gOLCAOuc7iA-unsplash-scaled.jpg'),
    Route(icon: 'quickroutes.png', text: 'Quick Routes', url: 'https://www.vendus.com/ao/foto/part-time-1200_og.jpg'),
    Route(icon: 'lesserknownspots.png', text: 'Lesser Known Spots', url: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/80/c0.jpg'),
    Route(icon: 'historicspots.png', text: 'Historic Spots', url: 'https://www.agendalx.pt/content/uploads/2019/12/castelosaojorgelisboa3473.jpg'),
    Route(icon: 'recentlyadded.png', text: 'Recently Added', url: 'https://mediawiki.ivao.aero/images/9/9e/NEW.jpg')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 55,
          title: Text("Types of routes", style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(

                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                gradient: LinearGradient(
                    colors: [Colors.red,Colors.redAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )

            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage('assets/login_background.png'),
              fit: BoxFit.cover
            // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
          ),
        ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: routes.length,
                    itemBuilder: (BuildContext ctx, int index){
                      return Container(
                          margin: EdgeInsets.all(15),
                          height: 200,
                          child: InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        MostFamousSpotsPage()),
                                  );
                                }
                                if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        QuickRoutesPage()),
                                  );
                                }
                                if (index == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        HistoricPlacesPage()),
                                  );
                                }
                              },

                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned.fill( //guarantees the image fills the stack area
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(routes[index].url, fit: BoxFit.cover),
                                      )
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 170,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight: Radius.circular(15)
                                            ),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black.withOpacity(0.3),
                                                  Colors.transparent
                                                ]
                                            )
                                        ),
                                      )
                                  ),
                                  Positioned(
                                    bottom: 13.5,
                                    left: 35,
                                    right: 35,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.black.withOpacity(0.3),
                                                Colors.black.withOpacity(0.4)
                                              ]
                                          )
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: Row(
                                        children: [
                                          Text(' ' + routes[index].text,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25
                                            ),
                                          )
                                        ],
                                      ),
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