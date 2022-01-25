// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../home_page.dart';
import 'ab_body.dart';
import 'latest_news.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    // ignore: prefer_final_fields
    bool _snap = false;
    bool _floating = false;

    // ignore: prefer_final_fields, unused_field

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEB6C30),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 30.0,
          ),
        ),
        title: Text(
          'About Me',
          style: TextStyle(
            color: Color(0xffffffff),
            fontFamily: 'Poppins',
            fontSize: 23.0,
          ),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: about_body(),
    );
  }
}
