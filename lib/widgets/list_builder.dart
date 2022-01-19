import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/routes_page.dart';

class ListBuilder extends StatelessWidget {
  final String title;
  final List<Map<String, Object>> list;

  const ListBuilder({Key key, this.title, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 55,
          title: Text(this.title,
              style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
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
                  fit: BoxFit.cover
                  ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: this.list.length,
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
                                  image: NetworkImage(this.list[index]["image"]),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: InkWell(
                              onTap: () {
                                var widget;
                                if (this.list[index]["list"] != null) {
                                  widget = ListBuilder(
                                      title: this.list[index]["name"],
                                      list: this.list[index]["list"]);
                                } else {
                                  widget = RoutesPage(
                                      name: this.list[index]["name"],
                                      spots: this.list[index]["spots"]);
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => widget));
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
                                    width: 300,
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
                                    child: Text(this.list[index]["name"], textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
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
