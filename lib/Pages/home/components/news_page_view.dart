// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class NewsPageView extends StatelessWidget {
  const NewsPageView({
    Key? key,
    required this.article,
  });

  final article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff434343),
            expandedHeight: 210.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "${article.title}",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              background: Container(
                // ignore: unnecessary_new
                decoration: new BoxDecoration(
                  color: Color(0xff434343),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    // ignore: unnecessary_new
                    image: new NetworkImage(
                      article.urlToImage,
                    ),
                  ),
                ),
              ),
            ),
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xffFB8A30),
                size: 40.0,
              ),
            ),
          ),
          // Anther sliver widget: SliverList
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // ignore: sized_box_for_whitespace

                Container(
                  height: 1000,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '${article.description}',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontFamily: 'Poppins-R',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
