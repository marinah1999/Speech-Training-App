import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:main_color.dart';
import 'dart:ui';
import 'login.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container(
        decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          HexColor('#43cea2'),
          HexColor('#185a9d'),
        ],
        stops: const [0.40, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ));
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Fluencia ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            accountEmail: Text(
              'Fluencia@gmail.com',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/images.png',
                  fit: BoxFit.cover,
                  width: 170,
                  height: 170,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/river.png'),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.favorite),

          //   title: Text('Favorites'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text('Friends'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text('Share'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.notifications,
          //     color: Colors.purple[200],
          //   ),
          //   title: Text('Manage notifications'),
          //   onTap: () => null,
          // ),

          // Divider(
          //   color: Colors.purpleAccent,
          //   height: 30,
          // ),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.teal[300],
            ),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.of(context).pushNamed('/mycard');
            },
          ),
          Divider(
            color: Colors.purpleAccent,
            height: 30,
          ),
          ListTile(
            title: Text('Exit'),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.amber,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
