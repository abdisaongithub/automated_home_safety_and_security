// To parse this JSON data, do
//
//     final tokenPair = tokenPairFromMap(jsonString);

import 'dart:convert';

class TokenPair {
  TokenPair({
    this.refresh,
    this.access,
  });

  String refresh;
  String access;

  factory TokenPair.fromJson(String str) => TokenPair.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenPair.fromMap(Map<String, dynamic> json) => TokenPair(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toMap() => {
    "refresh": refresh,
    "access": access,
  };
}
