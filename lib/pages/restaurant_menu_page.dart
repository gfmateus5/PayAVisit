import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'borgar_list.dart';


class RestaurantMenuPage extends StatefulWidget {
  @override
  _RestaurantMenuPageState createState() => _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends State<RestaurantMenuPage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = CARNES;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 180,
          width: 400,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)],
            color: Colors.white,
            border: Border.all(
              color: Colors.blue.shade300.withOpacity(0.6),
              width: 5
            ),
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.65), BlendMode.dstATop),
              image: new NetworkImage(post['image']),
            ),
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 25, right: 25),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(post['name'] + ': ' + post['price'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)
                  ],
                ),
              ),
            ]
          ),
        ),
      );
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: Wrap(
            children: [
              Text("Menu ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 33)),
              Icon(
                Icons.restaurant_menu,
                size: 33,
                color: Colors.white,
              )
            ],
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blueAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 15),
          height: size.height,
          width: size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 1.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}