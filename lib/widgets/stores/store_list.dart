import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/widgets/list_items.dart';
import 'package:flutter_google_maps_exemplo/widgets/stores/store_details.dart';

class StoreList extends StatelessWidget {

  final QuerySnapshot<Map<String, dynamic>> _postData;

  StoreList(this._postData);


  List<Widget> getPostsData() {
    List<Widget> listItems = [];
    _postData.docs.forEach((post) {
      listItems.add(StoreDetails(
        name: post['name'],
        image: post['image'],
      ));
    });
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return ListItems(listItems: getPostsData());
  }
}
