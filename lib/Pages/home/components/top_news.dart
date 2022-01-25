// ignore_for_file: unnecessary_new, prefer_const_constructors, duplicate_ignore
import 'dart:async';
import 'package:flutter/material.dart';
import '../home_page.dart';
import '/Api controller/home_api_controller.dart';
import '/models/models.dart';
import 'news_page_view.dart';

class Top_news extends StatefulWidget {
  @override
  _Top_newsState createState() => _Top_newsState();
}

class _Top_newsState extends State<Top_news> {
  late Future<NewsModel?> _newsModel;

  @override
  void initState() {
    _newsModel = HomeController().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          'Top News',
          style: TextStyle(
            color: Color(0xffffffff),
            fontFamily: 'Poppins',
            fontSize: 23.0,
          ),
        ),
      ),
      backgroundColor:  Color(0xfff0ebe9),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
      child: FutureBuilder<NewsModel?>(
          future: _newsModel,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                // ignore: prefer_const_constructors
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  var article = snapshot.data.articles[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NewsPageView(article: article);
                          },
                        ),
                      );
                    },
                    child: Container(
                       decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                      height: 260.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Card(
                          color: Color(0xffffffff),
                          elevation: 5.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.fill,
                                  height: 150.0,
                                  width: double.infinity,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0, left:20.0, right:20.0, bottom: 10.0),
                                        child: Text(
                                          '${article.title}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-R',
                                            fontSize: 20.0,
                                          ),
                                          
                                        ),
                                      ),
                                      Text(
                                        'Publish Date: ${article.publishedAt}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins-R',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Data Not Found");
            }
            return Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator( color: Color(0xffFB8A30),),
            );
          },
      ),
    ),
        ));
  }
}
