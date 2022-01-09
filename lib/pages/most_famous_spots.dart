import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/must_see_central_lisbon.dart';
class MostFamousSpotsPage extends StatefulWidget {
  @override
  _MostFamousSpotsPage createState() => _MostFamousSpotsPage();
}
class MostFamousSpot {
  String text;
  MostFamousSpot({this.text});
}
class _MostFamousSpotsPage extends State<MostFamousSpotsPage> {

  List<MostFamousSpot> spots = [
    MostFamousSpot(text: 'Must See Spots in Central Lisbon'),
    MostFamousSpot(text: 'Amadora Scenic View'),
    MostFamousSpot(text: 'Get To Know Sintra'),
    MostFamousSpot(text: 'Walk Around Cascais'),
    MostFamousSpot(text: 'The Southern Margin of the Tagus')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Choose the Route you want'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: spots.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
              child: Card(
                color: Colors.amber,
                child: ListTile(
                    title: Text(spots[index].text),

                    onTap: () {
                      if (spots[index].text == 'Must See Spots in Central Lisbon')
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MustSeeCentralLisbonPage()),
                        );
                      else;
                    },

                ),
              ),
            );
          }
      ),
    );
  }
}