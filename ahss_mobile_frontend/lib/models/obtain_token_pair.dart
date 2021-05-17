// To parse this JSON data, do
//
//     final obtainTokenPair = obtainTokenPairFromMap(jsonString);

import 'dart:convert';

ObtainTokenPair obtainTokenPairFromMap(String str) => ObtainTokenPair.fromMap(json.decode(str));

String obtainTokenPairToMap(ObtainTokenPair data) => json.encode(data.toMap());

class ObtainTokenPair {
  ObtainTokenPair({
    this.refresh,
    this.access,
  });

  String refresh;
  String access;

  factory ObtainTokenPair.fromMap(Map<String, dynamic> json) => ObtainTokenPair(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toMap() => {
    "refresh": refresh,
    "access": access,
  };
}
