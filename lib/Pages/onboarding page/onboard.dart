import 'package:flutter/material.dart';
import '/Pages/home/home_page.dart';
import '/components/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/model.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;

  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/br-news.jpg',
      text: "Breaking news Whtever Hapened In The Comunity M News",
      bg: Colors.red,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/l-news.jpg',
      text: "Get the latest news and breaking news from Bangladesh and around the globe.",
      bg: Colors.green,
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images/top-news.jpg',
      text: "Find the latest top news news and information on the top stories",
      bg: Colors.green,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      appBar: AppBar(
          backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: currentIndex % 2 == 0 ? Cwhite : Cwhite,
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PageView.builder(
                      itemCount: screens.length,
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (_, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              screens[index].img,
                              height: 300.0,
                              width: 700.0,
                            ),
                            Container(
                              height: 10.0,
                              child: ListView.builder(
                                itemCount: screens.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          width: currentIndex == index ? 25 : 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: currentIndex == index
                                                ? kbrown
                                                : kbrown300,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ]);
                                },
                              ),
                            ),
                            Text(
                              screens[index].text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: index % 2 == 0 ? Cwhite : Cwhite,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                print(index);
                                if (index == screens.length - 1) {
                                  await _storeOnboardInfo();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                }

                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceIn,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 10),
                                decoration: BoxDecoration(
                                    color: index % 2 == 0 ? kblue : kwhite,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: index % 2 == 0
                                                ? Cwhite
                                                : Cwhite),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_sharp,
                                        color: index % 2 == 0 ? Cwhite : Cwhite,
                                      )
                                    ]),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
