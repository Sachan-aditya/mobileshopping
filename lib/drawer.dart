import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.black45,
      child: Container(
          color: Colors.blue,
          child: ListView(children: const [
            DrawerHeader(
              padding: EdgeInsets.only(top: 20),
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text('Aditya'),
                  accountEmail: Text('sachanaditya@gmail.com'),
                  arrowColor: Color.fromRGBO(221, 115, 54, 0.976),
                  currentAccountPicture: CircleAvatar(
                    radius: 29,
                    backgroundImage: AssetImage('assets/images/aditya.jpg'),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                Icons.face,
                color: Colors.white,
              ),
              title: Text("Profile", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              title: Text(
                'mail me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ])),
    );
  }
}
