// To parse this JSON data, do
//
//     final settingsModel = settingsModelFromMap(jsonString);

import 'dart:convert';

class SettingsModel {
  SettingsModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory SettingsModel.fromJson(String str) => SettingsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromMap(Map<String, dynamic> json) => SettingsModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.state,
  });

  int id;
  String name;
  bool state;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    state: json["state"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "state": state,
  };
}
