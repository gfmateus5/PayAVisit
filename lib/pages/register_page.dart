import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_google_maps_exemplo/pages/payavisit_page.dart';
import 'package:flutter_google_maps_exemplo/pages/register_page.dart';
List<bool> isSelected = [false, false];
int tappedIndex = 3;
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/login_background.png',
                    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .15,
                                      bottom: size.width * .1,
                                    ),
                                    child: Image.asset(
                                        'assets/payavisit_cut.png',
                                        height: 40,
                                        width: 300
                                    ),
                                  ),
                                  component(
                                      Icons.account_circle_outlined,
                                      'User name...',
                                      false
                                  ),
                                  component(
                                      Icons.account_circle_outlined,
                                      'Email...',
                                      false
                                  ),
                                  component(
                                      Icons.lock_outline,
                                      'Password...',
                                      true
                                  ),
                                  component(
                                      Icons.lock_outline,
                                      'Enter Password Again...',
                                      true
                                  ),


                                  //SizedBox(height: size.width * .2),
                                  Container(

                                    height: size.width / 3,
                                    width: size.width / 1.25,
                                    alignment: Alignment.center,
                                    child: LayoutBuilder(builder: (context, constraints) {
                                      return ToggleButtons(
                                        borderRadius: BorderRadius.circular(
                                            8.0),
                                        children: <Widget>[
                                          Container(width: (MediaQuery.of(context).size.width - 128)/2, child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[new Icon(Icons.person,size: 16.0,color: tappedIndex == 0 ? Colors.blue: Colors.white,),new SizedBox(width: 4.0,), new Text("REGULAR USER",style: TextStyle(color: tappedIndex == 0 ? Colors.blue: Colors.white,),)],)),
                                          Container(width: (MediaQuery.of(context).size.width - 128)/2, child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[new Icon(Icons.business,size: 16.0,color: tappedIndex == 1 ? Colors.blue: Colors.white,),new SizedBox(width: 4.0,), new Text("BUSINESS",style: TextStyle(color: tappedIndex == 1 ? Colors.blue: Colors.white,))],)),
                                          //Container(width: (MediaQuery.of(context).size.width - 36)/3, child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[new Icon(Icons.ac_unit,size: 16.0,color: Colors.blue,),new SizedBox(width: 4.0,), new Text("COLD",style: TextStyle(color: Colors.blue))],)),
                                          /*Icon(Icons.person, color:
                                          tappedIndex == 0
                                              ? Colors.blue
                                              : Colors.white,
                                          ),
                                          Icon(Icons.business, color:
                                          tappedIndex == 1
                                              ? Colors.blue
                                              : Colors.white),*/
                                        ],

                                        onPressed: (int index) {
                                          setState(() {
                                            if(index==0){
                                              isSelected[0] = true;
                                              isSelected[1] = false;
                                            }
                                            if(index==1){
                                              isSelected[1] = true;
                                              isSelected[0] = false;
                                            }
                                            tappedIndex = index;
                                          });
                                        },
                                        isSelected: isSelected,
                                      );
                                    },
                                  ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            PayAVisitPage()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .05,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(.3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component(
      IconData icon, String hintText, bool isPassword) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}