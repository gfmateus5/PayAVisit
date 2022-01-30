import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contract_linking.dart';

class EventDetails extends StatefulWidget {
  final String name;
  final String image;
  final double distance;
  final String description;
  final String date;
  final String time;
  final String duration;
  final String by;

  const EventDetails({Key key, this.name, this.image, this.distance, this.description, this.date, this.time, this.duration, this.by}) : super(key: key);

  @override
  _EventDetails createState() => _EventDetails();
}

class _EventDetails extends State<EventDetails> {

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                side: BorderSide(
                  color: Colors.purple.shade400,
                  width: 6,
                )
            ),
            backgroundColor: Colors.grey.shade900,
            children: <Widget>[
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(widget.name, style: TextStyle(
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
                            child: Image.network(widget.image, fit: BoxFit.cover),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 250, top: 10, right: 14),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.duration + ' ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(
                              Icons.timelapse,
                              size: 15,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14, top: 10, right: 225),
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.time + ' ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.access_time_outlined,
                              size: 15,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 240, top: 140, right: 14),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.date + ' ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.date_range,
                              size: 15,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      )
                    ]
                ),
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: Text(widget.description, style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                    textAlign: TextAlign.center
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 15),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Brought to you by:', style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.by, style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                            textAlign: TextAlign.center
                        ),
                      ],
                    )
                  ],
                )
              ),
            ]
        )
    );
  }
}

