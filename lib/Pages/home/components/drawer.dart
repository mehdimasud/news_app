// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'about.dart';
import 'top_news.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Color(0xffEB6C30),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                minRadius: 50.0,
                maxRadius: 50.0,
                backgroundImage: AssetImage("assets/images/masud.png"),
              ),
              accountEmail: Text('mehdi.2507@gmail.com'),
              accountName: Text(
                'Mehdi Masud Mazumder',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 50.0,
              color: Color(0xffffffff),
            ),
            // ignore: prefer_const_constructors
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 24.0,
                  color:Color(0xffffffff),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(
                context,
              );
            },
          ),
            ListTile(
            leading: Image.asset("assets/logo/app_logo.png", height: 40.0,),
            title: Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text(
                  ' Top News',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xffffffff),
                  ),
                ),
            ),
            
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Top_news(),
                ),
              );
            },
          ),
         
          ListTile(
            leading: Image.asset("assets/logo/about.png"),
            title: Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: const Text(
                ' About Me',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
