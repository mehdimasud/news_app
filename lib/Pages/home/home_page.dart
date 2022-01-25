// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:news_app/Pages/home/components/ab_body.dart';
import '/Api controller/home_api_controller.dart';
import '/models/models.dart';
import 'dart:async';
import 'components/about.dart';
import 'components/drawer.dart';
import 'components/home.dart';
import 'components/latest_news.dart';
import 'components/search_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  bool _pinned = true;
  // ignore: prefer_final_fields
  bool _snap = false;
  bool _floating = false;
  late Future<NewsModel?> _newsModel;

  @override
  void initState() {
    // _newsModel = HomeController().getNews();
    _newsModel = HomeController().getNews();
    super.initState();
  }

  // ignore: prefer_final_fields, unused_field
  int _currentIndex = 0;

  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      DefaultTabController(
        length: 1,
        child: TabBarView(
          children: [
            // This CustomScrollView display the Home tab content
            CustomScrollView(
              slivers: [
                // Anther sliver widget: SliverList
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // ignore: sized_box_for_whitespace
                      Container(
                        color: Colors.blueGrey,
                        height: 900,
                        child: Homepage(
                            newsModel: _newsModel,
                            pinned: _pinned,
                            snap: _snap,
                            floating: _floating),
                      ),

                      // ignore: sized_box_for_whitespace
                    ],
                  ),
                ),
              ],
            ),

            // This shows the Settings tab content
          ],
        ),
      ),
      DefaultTabController(
        length: 1,
        child: TabBarView(
          children: [
            // This CustomScrollView display the Home tab content
            CustomScrollView(
              slivers: [
                // Anther sliver widget: SliverList
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // ignore: sized_box_for_whitespace
                      Container(
                        color: Colors.blueGrey,
                        height: 4400,
                        child: Latest_news(),
                      ),

                      // ignore: sized_box_for_whitespace
                    ],
                  ),
                ),
              ],
            ),

            // This shows the Settings tab content
          ],
        ),
      ),
      Container(
        child: about_body(),
      ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffEB6C30),
          centerTitle: true,
          title: Text(
            'M News',
            // ignore: unnecessary_new
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        drawer: drawer(),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          selectedIconTheme: IconThemeData(color: Color(0xffEB6C30), size: 30),
          selectedItemColor: Color(0xffEB6C30),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Color(0xff122A19),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_sharp),
              label: 'All News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv_sharp),
              label: 'Top News',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffEB6C30),
              icon: Icon(Icons.person),
              label: 'About Me',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
