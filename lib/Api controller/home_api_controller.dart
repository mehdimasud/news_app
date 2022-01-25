import 'dart:convert';

import 'package:http/http.dart' as http;

import '/Api controller/string.dart';
import '/models/models.dart';
class HomeController {
  Future<NewsModel?> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var response = await client.get(Uri.parse(Strings.news_url));

      if (response.statusCode == 200) {
        var jesonString = response.body;
        var jsonMap = json.decode(jesonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
