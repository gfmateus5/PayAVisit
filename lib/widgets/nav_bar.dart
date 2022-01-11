import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/login_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.grey.shade900,
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Dinis 'A Pedra'"),
                  accountEmail: Text('Level 3'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/dinis.png',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    /*image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),*/
                  )),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.white),
                title: Text('Favorites', style: TextStyle(color: Colors.white)),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('Friends', style: TextStyle(color: Colors.white)),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.share, color: Colors.white),
                title: Text('Share', style: TextStyle(color: Colors.white)),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.white),
                title: Text('Request', style: TextStyle(color: Colors.white)),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.description, color: Colors.white),
                title: Text('Policies', style: TextStyle(color: Colors.white)),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                title: Text('Log out', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
              ),
            ],
          ),
        )
    );
  }
}
