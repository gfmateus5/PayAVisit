import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/baixa_chiado_route.dart';
import 'package:flutter_google_maps_exemplo/pages/belem_route.dart';
import 'package:flutter_google_maps_exemplo/pages/must_see_central_lisbon.dart';
import 'package:flutter_google_maps_exemplo/pages/praca_comercio_route.dart';

import 'marques_route.dart';
class QuickRoutesPage extends StatefulWidget {
  @override
  _QuickRoutesPage createState() => _QuickRoutesPage();
}
class QuickRoute {
  String text;
  String url;

  QuickRoute({this.text, this.url});
}
class _QuickRoutesPage extends State<QuickRoutesPage> {

  List<QuickRoute> spots = [
    QuickRoute(text: 'Belém', url: 'https://media.iatiseguros.com/wp-content/uploads/sites/6/2020/01/28164823/panoramica-belem.jpg'),
    QuickRoute(text: 'Baixa-Chiado', url: 'https://www.bestguide.pt/wp-content/uploads/2019/07/Chiado_06.jpg'),
    QuickRoute(text: 'Praça do Comércio', url: 'https://i2.wp.com/turismo.eurodicas.com.br/wp-content/uploads/2019/04/pra%C3%A7a-do-comercio-em-lisboa.jpg?fit=1360%2C907&ssl=1'),
    QuickRoute(text: 'Marquês de Pombal', url: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/80/c0.jpg')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: Text("QUICK ROUTES"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Colors.red,Colors.redAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
        ),
        body: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: spots.length,
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
                                        BelemRoute()),
                                  );
                                }
                                if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        ChiadoRoute()),
                                  );
                                }
                                if (index == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        PracaComercioRoute()),
                                  );
                                }
                                if (index == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        MarquesRoute()),
                                  );
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned.fill( //guarantees the image fills the stack area
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(spots[index].url, fit: BoxFit.cover),
                                      )
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 180,
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
                                          Text(spots[index].text,
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