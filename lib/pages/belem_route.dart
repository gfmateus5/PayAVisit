import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/must_see_central_lisbon.dart';
class BelemRoute extends StatefulWidget {
  @override
  _BelemRoute createState() => _BelemRoute();
}
class QuickRoute {
  String text;
  String url;
  String money;
  String description;

  QuickRoute({this.text, this.url, this.money, this.description});
}
class _BelemRoute extends State<BelemRoute> {

  List<QuickRoute> spots = [
    QuickRoute(text: 'Torre de Belém', url: 'https://dicasdelisboa.com.br/wp-content/uploads/2015/03/torre-de-belem-lisboa-3.jpg', money: '200',
        description: 'Este monumento foi construído com o propósito de servir tanto como porta de entrada para a cidade de Lisboa mas também como defesa contra possíveis invasões e ataques a partir do Tejo.'),
    QuickRoute(text: 'Padrão dos Descobrimentos', url: 'https://cdn.getyourguide.com/img/location/54d8c4646ea4f.jpeg/88.jpg', money: '250',
        description: 'Este monumento foi construído com o propósito de servir tanto como porta de entrada para a cidade de Lisboa mas também como defesa contra possíveis invasões e ataques a partir do Tejo.'),
    QuickRoute(text: 'Mosteiro dos Jerónimos', url: 'https://www.mundoportugues.pt/wp-content/uploads/sites/3/2017/10/article_64292.jpg', money: '275',
        description: 'Este monumento foi construído com o propósito de servir tanto como porta de entrada para a cidade de Lisboa mas também como defesa contra possíveis invasões e ataques a partir do Tejo.')
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
          toolbarHeight: 55,
          title: Text("Belém", style: TextStyle(color: Colors.black, fontSize: 22)),
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
                    itemCount: spots.length,
                    itemBuilder: (BuildContext ctx, int index){
                      return Container(
                          margin: EdgeInsets.all(15),
                          height: 200,
                          child: InkWell(
                              onTap: () {
                                showDialog(context: context, builder: (context) =>
                                  SimpleDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                                    backgroundColor: Colors.grey.shade900,
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Text(spots[index].text, style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 15),
                                      ClipRRect(
                                        child: Image.network(spots[index].url, height: 200, fit: BoxFit.fill,),
                                      ),
                                      SizedBox(height: 22),
                                      Container(
                                        margin: EdgeInsets.only(left: 35, right: 35),
                                        alignment: FractionalOffset.center,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: Wrap(
                                          children: [
                                            Text('Redeem ' + spots[index].money,
                                            style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,),
                                            Icon(
                                              Icons.attach_money,
                                              color: Colors.amber,
                                              size: 25,
                                            )
                                          ]
                                        )
                                      ),
                                      SizedBox(height: 22),
                                      Container(
                                        margin: EdgeInsets.only(left: 35, right: 35, bottom: 15),
                                        child: Text(spots[index].description, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                          textAlign: TextAlign.center
                                        ),
                                      )
                                    ]
                                  )
                                );
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
                                    left: 25,
                                    right: 25,
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
                                    top: 10,
                                    left: 280,
                                    right: 10,
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
                                      child: Row(
                                        children: [
                                          Text('  ' + spots[index].money,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25
                                            ),
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