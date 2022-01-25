import 'package:flutter/material.dart';
import '/models/models.dart';
import 'home_slider.dart';
import 'latest_news.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
    required Future<NewsModel?> newsModel,
    required bool pinned,
    required bool snap,
    required bool floating,
  })  : _newsModel = newsModel,
        _pinned = pinned,
        _snap = snap,
        _floating = floating,
        super(key: key);

  final Future<NewsModel?> _newsModel;
  final bool _pinned;
  final bool _snap;
  final bool _floating;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // ignore: sized_box_for_whitespace
                  Container(
                    color: Color(0xfff0ebe9),
                    height: 320.0,
                    child: HomeSlider(newsModel: _newsModel),
                  ),

                  Container(
                    height: 4600,
                    color:  Color(0xfff0ebe9),
                    child: Latest_news(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
