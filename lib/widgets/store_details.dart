import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps_exemplo/pages/restaurant_menu_page.dart';
import 'open_painter.dart';

class StoreDetails extends StatelessWidget {
  final String name;
  final String image;

  const StoreDetails({Key key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  RestaurantMenuPage()),
            );
          },
          child: Container(
            height: size.width / 8,
            width: size.width / 1.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Check Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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