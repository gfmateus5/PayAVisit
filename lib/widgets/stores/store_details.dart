import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps_exemplo/pages/restaurant_menu_page.dart';
import 'package:provider/provider.dart';
import '../../contract_linking.dart';

class StoreDetails extends StatelessWidget {
  final String name;
  final String image;
  final double distance;
  final String rating;
  final String description;
  final String type;
  final String price;

  const StoreDetails({Key key, this.name, this.image, this.distance, this.rating, this.description, this.type, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                side: BorderSide(
                  color: Colors.grey.shade800,
                  width: 6,
                )
            ),
            backgroundColor: Colors.grey.shade900,
            children: <Widget>[
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(name, style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned.fill( //guarantees the image fills the stack area
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Image.network(image, fit: BoxFit.cover),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 9),
                      margin: EdgeInsets.only(left: 260, top: 10, right: 14),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black.withOpacity(0.4)
                      ),
                      child: Row(
                        children: [
                          Text(rating + ' ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14, top: 10, right: 260),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black.withOpacity(0.4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(price,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
                ),
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: FractionalOffset.center,
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantMenuPage()));
                      },
                      child: Wrap(
                        children: [
                          Text('Check Menu ',
                            style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                            size: 23,
                          )
                        ]
                      )
                    ),
                  ),
                  /*Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: FractionalOffset.center,
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )*/
                ]
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 15),
                child: Text(description, style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                    textAlign: TextAlign.center
                ),
              )
            ]
        )
    );
  }
}