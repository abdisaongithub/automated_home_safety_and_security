
import 'dart:convert';

class SettingModel {
  SettingModel({
    this.id,
    this.name,
    this.state,
  });

  int id;
  String name;
  bool state;

  factory SettingModel.fromJson(String str) => SettingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SettingModel.fromMap(Map<String, dynamic> json) => SettingModel(
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
