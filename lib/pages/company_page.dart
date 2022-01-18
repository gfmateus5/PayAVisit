import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter_google_maps_exemplo/pages/login_page.dart';
import 'package:flutter_google_maps_exemplo/pages/add_event_page.dart';
import 'package:get/get.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key key}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(children: [
          SizedBox(
            height: size.height,
            child: Image.asset(
              'assets/login_background.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 100),
                Container(
                  child: Text(
                    'Welcome back,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'TASCA DO ZÉ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  child: Text(
                    'This month, you have made',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '1025€',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'from PayAVisit users',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 200)
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade900,
          child: Wrap(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 5,
                    color: Colors.amber),
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 5,
                    color: Colors.purple),
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 5,
                    color: Colors.red),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          alignment: Alignment.bottomCenter,
                          constraints: BoxConstraints(maxHeight: 30),
                          icon: Icon(Icons.money_off, color: Colors.white),
                          onPressed: () => showDialog(
                              context: context,
                              builder: (context) => areYouSureDialog()),
                        ),
                        Text('Unsubscribe',
                            style: TextStyle(color: Colors.white)),
                        Text('', style: TextStyle(fontSize: 5)),
                      ],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          alignment: Alignment.bottomCenter,
                          constraints: BoxConstraints(maxHeight: 30),
                          icon: Icon(Icons.theater_comedy, color: Colors.white),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddEventPage())),
                        ),
                        Text('Add Event',
                            style: TextStyle(color: Colors.white)),
                        Text('', style: TextStyle(fontSize: 5)),
                      ],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                            alignment: Alignment.bottomCenter,
                            constraints: BoxConstraints(maxHeight: 30),
                            icon: Icon(Icons.exit_to_app, color: Colors.white),
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                )),
                        Text('Logout', style: TextStyle(color: Colors.white)),
                        Text('', style: TextStyle(fontSize: 5)),
                      ],
                    )),
              ],
            ),
          ])),
    );
  }

  areYouSureDialog() {
    return SimpleDialog(
      title: Text("ARE YOU SURE?",
          textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 6,
          )),
      backgroundColor: Colors.grey.shade900,
      children: [
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
              child: Text('Yes',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))))),
          ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('No',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))))),
        ])
      ],
    );
  }
}
