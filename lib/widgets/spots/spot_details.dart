import 'dart:ui';
import 'package:flutter_google_maps_exemplo/constants/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/pages/payavisit_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_google_maps_exemplo/widgets/list_builder.dart';

import '../../contract_linking.dart';

class SpotDetails extends StatefulWidget {
  final Map<String, dynamic> spot;
  final double distance;

  const SpotDetails({Key key,this.spot, this.distance}) : super(key: key);

  @override
  State<SpotDetails> createState() => _SpotDetailsState();
}

class _SpotDetailsState extends State<SpotDetails> {

  Color color;
  IconData icon;

  far() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 6,
          )
      ),
      backgroundColor: Colors.grey.shade900,
      children: <Widget> [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Text('Too far away to be able to redeem!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23), textAlign: TextAlign.center),
        )
      ]
    );
  }

  redeemed() {
    return SimpleDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            side: BorderSide(
              color: Colors.grey.shade800,
              width: 6,
            )
        ),
        backgroundColor: Colors.grey.shade900,
        children: <Widget> [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('From visiting', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23), textAlign: TextAlign.center),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.spot["name"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23), textAlign: TextAlign.center),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('you received ' + widget.spot["coins"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23), textAlign: TextAlign.center),
                    Icon(Icons.run_circle, size: 25, color: Colors.white)
                  ],
                )
              ],
            )
          )
        ]
    );
  }

  isFavorite(spot) {
    return PayAVisitController.to.likedSpots.contains(spot);
  }

  @override
  Widget build(BuildContext context) {
    if (!isFavorite(widget.spot["name"])) {
        color = Colors.white;
        icon = Icons.favorite_border;
    } else{
        color = Colors.red;
        icon = Icons.favorite;
    }
    var contractLink = Provider.of<ContractLinking>(context);
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
              child: Text(widget.spot["name"], style: TextStyle(
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
                        child: Image.network(widget.spot["image"], fit: BoxFit.cover),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 260, top: 10, right: 14),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black.withOpacity(0.4)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.spot["rating"] + ' ',
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
                    margin: EdgeInsets.only(top: 10, right: 260),
                    height: 30,
                    child: InkWell(
                      onTap: () {
                        if (!isFavorite(widget.spot["name"])) {
                          PayAVisitController.to.likedSpots.add(widget.spot["name"]);
                          setState(() {
                            color = Colors.white;
                            icon = Icons.favorite_border;
                          });
                        } else{
                          PayAVisitController.to.likedSpots.remove(widget.spot["name"]);
                          setState(() {
                            color = Colors.red;
                            icon = Icons.favorite;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            size: 35,
                            color: color,
                          ),
                        ],
                      )
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
                  height: 40,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.distance < 2000 ? Colors.amber : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: InkWell(
                    onTap: ()
                    {
                      if (widget.distance < 2000){
                        Navigator.pop(context, contractLink.writeContract(contractLink.addDepositAmount, [BigInt.parse(widget.spot["coins"])]));
                        showDialog(context: context, builder: (context) => redeemed());
                      }
                      else {
                        showDialog(context: context, builder: (context) => far());
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Redeem ' + widget.spot["coins"] + ' ',
                          style: TextStyle( color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.run_circle,
                          color: Colors.white,
                          size: 22,
                        )
                      ]
                    )
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.red
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListBuilder(title: "Types of Routes", list: route_types)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Check Routes',
                          style: TextStyle( color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.alt_route,
                          color: Colors.white,
                          size: 20,
                        )
                      ]
                    ),
                  ),
                )
              ]
            ),
            SizedBox(height: 22),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35, bottom: 15),
              child: Text(widget.spot["description"], style: TextStyle(
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
