import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class Route {
  String icon;
  String text;

  Route({this.icon, this.text});
}

class _RoutePageState extends State<RoutePage> {

  List<Route> routes = [
    Route(icon: 'mostfamousspots.png', text: 'Most Famous Spots'),
    Route(icon: 'quickroutes.png', text: 'Quick Routes'),
    Route(icon: 'lesserknownspots.png', text: 'Lesser Known Spots'),
    Route(icon: 'historicspots.png', text: 'Historic Spots'),
    Route(icon: 'recentlyadded.png', text: 'Recently Added')
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
        title: Text('CHOOSE THE ROUTE TYPE'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
              child: Card(
                color: Colors.amber,
                child: ListTile(
                  onTap: () {},
                  title: Text(routes[index].text),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${routes[index].icon}'),
                    backgroundColor: Colors.transparent,)

                ),
              ),
            );
          }
      ),
    );
  }
}