import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/must_see_central_lisbon.dart';
class MostFamousSpotsPage extends StatefulWidget {
  @override
  _MostFamousSpotsPage createState() => _MostFamousSpotsPage();
}
class MostFamousSpot {
  String text;
  String url;

  MostFamousSpot({this.text, this.url});
}
class _MostFamousSpotsPage extends State<MostFamousSpotsPage> {

  List<MostFamousSpot> spots = [
    MostFamousSpot(text: 'Central Lisbon', url: 'https://www.lisbonguru.com/wp-content/uploads/2017/12/praca-do-comercio.jpg'),
    MostFamousSpot(text: 'Amadora Scenic View', url: 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Alfragide_norte%2C_outubro_2017_%28cropped%29.jpg'),
    MostFamousSpot(text: 'Get To Know Sintra', url: 'https://upload.travelawaits.com/ta/uploads/2021/05/sintra-cover.jpg'),
    MostFamousSpot(text: 'Walk Around Cascais', url: 'https://www.eurodicas.com.br/wp-content/uploads/2019/05/morar-em-cascais.jpg'),
    MostFamousSpot(text: 'Margin of the Tagus', url: 'https://s7a5n8m2.stackpathcdn.com/wp-content/uploads/2015/03/riotejo.jpg')
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
        title: Text("Most Famous Spots"),
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
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MustSeeCentralLisbonPage()),
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
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.4),
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