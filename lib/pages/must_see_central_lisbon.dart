import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MustSeeCentralLisbonPage extends StatefulWidget {
  @override
  _MustSeeCentralLisbonPage createState() => _MustSeeCentralLisbonPage();
}

class _MustSeeCentralLisbonPage extends State<MustSeeCentralLisbonPage> {
  ScrollController controller = ScrollController();
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(margin:EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: InkWell(
            onTap: () => print("ciao"),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
              children: <Widget>[

                ListTile(
                  title: new Center(child: new Text(post["name"],
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20.0),)),
                  dense:true,
                ),
                ClipRRect(
                  child: Image.asset(
                      "assets/${post["image"]}",
                      height: 200,
                      fit:BoxFit.fill
                  ),
                ),
              ],
            ),
          ),
        ),));
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

      double value = controller.offset/218;

      setState(() {
        topContainer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: Text("Must see spots in central Lisbon"),
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
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 1,
              ),

              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        scale = index + 1.5 - topContainer;
                        if (scale < 0) {
                          scale = 0;
                        } else if (scale > 1) {
                          scale = 1;
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.8,
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