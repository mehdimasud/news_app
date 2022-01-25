// To parse this JSON data, do
//
//     final NewsModel = NewsModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

NewsModel NewsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String NewsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.articles,
  });

  List<Article> articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.title,
    required this.description,
    // this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.url,

    // this.content,
  });

  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  // String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "urlToImage": urlToImage,
        "url": url,
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
