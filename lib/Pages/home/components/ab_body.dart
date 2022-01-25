import 'package:flutter/material.dart';

class about_body extends StatelessWidget {
  const about_body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 350,
                // ignore: unnecessary_new
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    // ignore: unnecessary_new
                    image: AssetImage(
                      "assets/images/about_1.jfif",
                    ),
                  ),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          minRadius: 60.0,
                          maxRadius: 60.0,
                          backgroundImage:
                              AssetImage("assets/images/masud.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "I'M Mehdi Masud Mazumder",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 25.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xffEB6C30),
                height: 450,
                child: Container(
                  height: 400.0,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Card(
                    color: Color(0xffEB6C30),
                    child: ListTile(
                      title: Text(
                        "About Me",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 25.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      subtitle: Text(
                        "I'm Mehdi Masud Mazumder from Bangladesh, and I do on Web Design and Development also app development. I really enjoy learning languages and frameworks like C, C++, Dart, Javascript, Bootstrap, Flutter and React Native. I also enjoy wireframing, ui, ux, and design in general.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
