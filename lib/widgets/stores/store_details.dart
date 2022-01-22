import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/restaurant_menu_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:provider/provider.dart';
import '../../contract_linking.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreDetails extends StatefulWidget {
  final String name;
  final String image;
  final double distance;
  final String rating;
  final String description;
  final String type;
  final String price;

  const StoreDetails({Key key, this.name, this.image, this.distance, this.rating, this.description, this.type, this.price}) : super(key: key);

  @override
  _StoreDetails createState() => _StoreDetails();

}

class _StoreDetails extends State<StoreDetails> {

  int balance;
  RxDouble moneyToSpend;
  var contractLink;

  @override
  Widget build(BuildContext context) {
    contractLink = Provider.of<ContractLinking>(context);
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                side: BorderSide(
                  color: Colors.blue.shade300,
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
                        padding: EdgeInsets.only(left: 9),
                        margin: EdgeInsets.only(left: 260, top: 10, right: 14),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.4)
                        ),
                        child: Row(
                          children: [
                            Text(widget.rating + ' ',
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
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14, top: 10, right: 260),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.price,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                ),
              ),
              SizedBox(height: 22),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: FractionalOffset.center,
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantMenuPage(type: widget.type)));
                          },
                          child: Wrap(
                              children: [
                                Text('Check Menu ',
                                  style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(
                                  Icons.restaurant_menu,
                                  color: Colors.white,
                                  size: 23,
                                )
                              ]
                          )
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      alignment: FractionalOffset.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell(
                          onTap: () async {
                            var result = await contractLink.readContract(contractLink.getBalanceAmount, []);
                            balance = result?.first?.toInt();
                            moneyToSpend = balance.toDouble().obs;
                            showDialog(context: context, builder: (context) => pay());
                          },
                          child: Wrap(
                              children: [
                                Text('Pay ',
                                  style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(
                                  Icons.run_circle,
                                  color: Colors.white,
                                  size: 25,
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
                child: Text(widget.description, style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                    textAlign: TextAlign.center
                ),
              ),
              SizedBox(height: 10),
            ]
        )
    );
  }

  completed_transaction() {
    return SimpleDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            side: BorderSide(
              color: Colors.grey.shade800,
              width: 6,
            )
        ),
        backgroundColor: Colors.grey.shade900,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              alignment: Alignment.center,
              child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Transaction completed', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 12,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 70),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Available Balance:', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
                        ]
                    ),
                    SizedBox(height: 35),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${balance} ', style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          Icon(Icons.run_circle, size: 40, color: Colors.white)
                        ]
                    )
                  ]
              )
          ),
        ]
    );
  }

  pay_verification() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 6,
          )
      ),
      backgroundColor: Colors.grey.shade900,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
          alignment: Alignment.center,
          child: Text('Confirm transaction to ' + widget.name + '?', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Text('NO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center),
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 40,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: InkWell(
                onTap: () async {
                  await contractLink.writeContract(contractLink.payAmount, [BigInt.from(moneyToSpend.value)]);
                  var result = await contractLink.readContract(contractLink.getBalanceAmount, []);
                  balance = result?.first?.toInt();
                  Navigator.pop(context);
                  showDialog(context: context, builder: (context) => completed_transaction());
                },
                child: Text('YES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center),
              ),
            )
          ],
        ),
        SizedBox(height: 12)
      ],
    );
  }

  pay() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 6,
          )
      ),
      backgroundColor: Colors.grey.shade900,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.amber,
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Icons.person, color: Colors.white),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.amber),
                          shape:
                          MaterialStateProperty.all(const CircleBorder())),
                    ),
                  ),
                  TextSpan(
                    text: 'Dinis "A Pedra"',
                  )
                ],
              ),
            ),
          ]),
          Column(children: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: Icon(Icons.close, color: Colors.white),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(const CircleBorder())),
            )
          ]),
        ]),
        SizedBox(height: 30),
        Text('Current Balance',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.amber, fontSize: 20)),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${balance} ', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 40, fontWeight: FontWeight.bold)),
            Icon(Icons.run_circle, size: 35, color: Colors.amber)
          ],
        ),
        Obx(
              () => Slider(
              value: moneyToSpend.value,
              min: 0,
              max: balance.toDouble(),
              divisions: balance == 0 ? 1 : balance,
              label: moneyToSpend.value.toString(),
              onChanged: (value) {
                setState(() {
                  moneyToSpend.value = value;
                });
              }),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                showDialog(context: context, builder: (context) => pay_verification());
              },
              child: Container(
                height: 40,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text('PAY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white), textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }
}