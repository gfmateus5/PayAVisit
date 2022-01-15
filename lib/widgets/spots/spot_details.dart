import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contract_linking.dart';
import '../open_painter.dart';

class SpotDetails extends StatelessWidget {
  final String name;
  final String image;
  final double distance;
  final String description;
  final String coins;

  const SpotDetails({Key key, this.name, this.image, this.distance, this.description, this.coins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          backgroundColor: Colors.grey.shade900,
          children: <Widget>[
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(name, style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
              child: Image.network(image, height: MediaQuery.of(context).size.height/3.5, fit: BoxFit.fill,),
            ),
            SizedBox(height: 22),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 22, right: 35),
                  alignment: FractionalOffset.center,
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: distance < 2000 ? Colors.amber : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: InkWell(
                    onTap: () =>
                    {
                      if (distance < 2000){
                        Navigator.pop(context, contractLink.writeContract(contractLink.addDepositAmount, [BigInt.two]))
                      } else {
                        Navigator.pop(context)
                      }
                    },
                    child: Wrap(
                      children: [
                        Text('  Redeem ' + coins,
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
