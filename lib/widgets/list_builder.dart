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
                  // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                  ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: this.list.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                          margin: EdgeInsets.all(15),
                          height: 200,
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
                                  Positioned.fill(
                                      //guarantees the image fills the stack area
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          this.list[index]["image"],
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
                                    left: 35,
                                    right: 35,
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
                                    bottom: 20,
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: Row(
                                        children: [
                                          Text(
                                            ' ' + this.list[index]["name"],
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
