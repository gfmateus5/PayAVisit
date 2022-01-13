import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/widgets/spot_details.dart';

class SpotList extends StatelessWidget {

  final QuerySnapshot<Map<String, dynamic>> _postData;

  SpotList(this._postData);


  List<Widget> getPostsData() {
    List<Widget> listItems = [];
    _postData.docs.forEach((post) {
      listItems.add(SpotDetails(
        name: post['name'],
        image: post['image'],
      ));
    });
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = getPostsData();
    return Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listItems.length,
          //padding: EdgeInsets(height: ),
          itemBuilder: (context, index) {
            return Align(
              //heightFactor: 0.8,
              alignment: Alignment.topCenter,
              child: listItems[index],
            );
          },
        ));
  }
}
