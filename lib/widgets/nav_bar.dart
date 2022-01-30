import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/controllers/payavisit_controller.dart';
import 'package:flutter_google_maps_exemplo/pages/login_page.dart';
import 'package:flutter_google_maps_exemplo/pages/routes_page.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(PayAVisitController.to.spots);
    return Drawer(
      backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                          width: 5,
                          color: Colors.grey.shade800
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/dinis.png'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Dinis Rocha", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.grey.shade800.withOpacity(0.5)
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RoutesPage(name: "Favorites", spots: PayAVisitController.to.likedSpots)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Favorites', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Icon(Icons.favorite, size: 25, color: Colors.white,)
                    ],
                  ),
                )
              ),
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey.shade800.withOpacity(0.5)
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => RoutesPage(name: "Closest to you", spots: ["all"])));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Closest to you', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Icon(Icons.directions_walk, size: 25, color: Colors.white,)
                      ],
                    ),
                  )
              ),
              SizedBox(height: 300),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.grey.shade800.withOpacity(0.5)
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Logout', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Icon(Icons.exit_to_app, size: 25, color: Colors.white,)
                    ],
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}
