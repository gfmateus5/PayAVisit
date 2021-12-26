import 'package:flutter/material.dart';

class SpotDetails extends StatelessWidget {
  final String name;
  final String image;

  const SpotDetails({Key key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              image,
              //height: 150,
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth,
            ),

            /*Container(
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: */
            Flexible(
              child: Stack(children:[
                Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            ])),
          ],
        )
      ]),
    );
  }
}
