// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import 'news_page_view.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key? key,
    required Future<NewsModel?> newsModel,
  })  : _newsModel = newsModel,
        super(key: key);

  final Future<NewsModel?> _newsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _newsModel,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: EdgeInsets.all(5),
                child: CarouselSlider.builder(
                  itemCount: snapshot.data.articles.length,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 250,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      reverse: false,
                      aspectRatio: 5.0,
                      autoPlayAnimationDuration: Duration(seconds: 3)),
                  itemBuilder: (context, i, id) {
                    var article = snapshot.data.articles[i];

                    return GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            // ignore: unnecessary_new
                            decoration: new BoxDecoration(
                              // ignore: prefer_const_constructors
                              color: Color(0xff434343),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                // ignore: unnecessary_new
                                image: new NetworkImage(
                                  article.urlToImage,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${article.title}",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontFamily: 'Poppins-R',
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewsPageView(article: article);
                        }));
                      },
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              throw Text("Exrror");
            }
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xffFB8A30),
              ),
            );
          },
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: _newsModel.((urlOfItem) {
        //     int index = imagesList.indexOf(urlOfItem);
        //     return Container(
        //       width: 10.0,
        //       height: 10.0,
        //       margin: EdgeInsets.symmetric(
        //           vertical: 10.0, horizontal: 2.0),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: _currentIndex == index
        //             ? Color(0xffFB8A30)
        //             : Color.fromRGBO(0, 0, 0, 0.3),
        //       ),
        //     );
        //   }).toList(),
        // ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top:20.0, left: 20.0),
            child: Text(
              "Recent news",
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Poppins',
                color: Color(0xffFB8A30),
              ),
            ),
          ),
        )
      ],
    );
  }
}
