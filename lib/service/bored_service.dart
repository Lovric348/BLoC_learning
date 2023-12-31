// To parse this JSON data, do
//
//     final boredList = boredListFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

BoredList boredListFromJson(String str) => BoredList.fromJson(json.decode(str));

String boredListToJson(BoredList data) => json.encode(data.toJson());

class BoredList {
    String activity;
    String type;
    int participants;
    double price;
    String link;
    String key;
    double accessibility;

    BoredList({
        required this.activity,
        required this.type,
        required this.participants,
        required this.price,
        required this.link,
        required this.key,
        required this.accessibility,
    });

    factory BoredList.fromJson(Map<String, dynamic> json) => BoredList(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"].toDouble(),
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
    };
}
class BoredService {
  Future <BoredList> getBoredActivity() async {
    final response = await get(Uri.parse('https://www.boredapi.com/api/activity/'));//await smo uključili async na light bulbu
    final activity = boredListFromJson(response.body);
    return activity;
  }
}
