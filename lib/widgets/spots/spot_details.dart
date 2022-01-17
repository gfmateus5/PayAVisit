import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:provider/provider.dart';

import '../../contract_linking.dart';

class SpotDetails extends StatefulWidget {
  final Map<String, dynamic> spot;
  final double distance;

  const SpotDetails({Key key,this.spot, this.distance}) : super(key: key);

  @override
  State<SpotDetails> createState() => _SpotDetailsState();
}

class _SpotDetailsState extends State<SpotDetails> {

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
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
                    padding: EdgeInsets.only(left: 9),
                    margin: EdgeInsets.only(left: 260, top: 10, right: 14),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black.withOpacity(0.4)
                    ),
                    child: Row(
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
                  )
                ]
              ),
            ),
            SizedBox(height: 22),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 22),
                  padding: EdgeInsets.only(left: 7),
                  alignment: FractionalOffset.center,
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: widget.distance < 2000 ? Colors.amber : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: InkWell(
                    onTap: () =>
                    {
                      if (widget.distance < 2000){
                        Navigator.pop(context, contractLink.writeContract(contractLink.addDepositAmount, [BigInt.two]))
                      } else {
                        Navigator.pop(context)
                      }
                    },
                    child: Wrap(
                      children: [
                        Text('Redeem ' + widget.spot["coins"],
                          style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Colors.white,
                          size: 23,
                        )
                      ]
                    )
                  ),
                ),
                Container(
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
