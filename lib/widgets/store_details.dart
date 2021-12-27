import 'package:flutter/material.dart';

import 'open_painter.dart';

class StoreDetails extends StatelessWidget {
  final String name;
  final String image;

  const StoreDetails({Key key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Wrap(children: [
        CustomPaint(
          painter: OpenPainter(MediaQuery.of(context).size.width, 10, Colors.blue),
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
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
          child: Text(
            'SOME FUCKING DESCRIPTION',
            style: TextStyle(
              fontSize: 15,
              color: Colors.amber,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ]),
    );
  }
}

