import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {

  final List<Widget> listItems;

  const ListItems({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.topCenter,
              child: listItems[index],
            );
          },
        ));
  }
}