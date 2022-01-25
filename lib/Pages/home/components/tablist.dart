
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class tablist extends StatelessWidget {
  const tablist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black.withOpacity(0.3),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      labelColor: Colors.black,
      indicatorColor: Color(0xffFB8A30),
      indicatorWeight: 5.0,
      indicatorSize: TabBarIndicatorSize.label,
      // ignore: prefer_const_literals_to_create_immutables
      tabs: [
        Tab(
          child: Text(
            'All News',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Tab(
          child: Text(
            'Business',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Tab(
          child: Text(
            'polictics',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Tab(
          child: Text(
            'Tech',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Tab(
          child: Text(
            'Science',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Tab(
          child: Text(
            'Sports',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
