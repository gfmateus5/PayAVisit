import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contract_linking.dart';
import '../open_painter.dart';

class EventDetails extends StatelessWidget {
  final String name;
  final String image;
  final double distance;

  const EventDetails({Key key, this.name, this.image, this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);
    return Container(
      color: Colors.grey.shade900,
      child: Wrap(children: [
        CustomPaint(
          painter: OpenPainter(MediaQuery.of(context).size.width, 10, Colors.pink),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              image,
              //height: 150,
              width: MediaQuery.of(context).size.width / 2,
              //alignment: Alignment.center,
              fit: BoxFit.fitWidth,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(children: [
          Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Text(
                  'SOME FUCKING DESCRIPTION',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ))
        ]),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 15),
            child: ElevatedButton(
                onPressed: () {
                  contractLink.writeContract(
                      contractLink.addDepositAmount, [BigInt.two]);
                },
                child: Text('Redeem',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        distance < 2000 ? Colors.amber : Colors.grey),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)))))),
          )
        ])
      ]),
    );
  }
}

