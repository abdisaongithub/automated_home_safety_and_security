// To parse this JSON data, do
//
//     final sensorsSummary = sensorsSummaryFromMap(jsonString);

import 'dart:convert';

class SensorsSummary {
  SensorsSummary({
    this.temps,
    this.hum,
    this.pressure,
  });

  List<Temp> temps;
  List<Hum> hum;
  List<Pressure> pressure;

  factory SensorsSummary.fromJson(String str) => SensorsSummary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SensorsSummary.fromMap(Map<String, dynamic> json) => SensorsSummary(
    temps: List<Temp>.from(json["temps"].map((x) => Temp.fromMap(x))),
    hum: List<Hum>.from(json["hum"].map((x) => Hum.fromMap(x))),
    pressure: List<Pressure>.from(json["pressure"].map((x) => Pressure.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "temps": List<dynamic>.from(temps.map((x) => x.toMap())),
    "hum": List<dynamic>.from(hum.map((x) => x.toMap())),
    "pressure": List<dynamic>.from(pressure.map((x) => x.toMap())),
  };
}

class Hum {
  Hum({
    this.room,
    this.hum,
  });

  String room;
  double hum;

  factory Hum.fromJson(String str) => Hum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hum.fromMap(Map<String, dynamic> json) => Hum(
    room: json["room"],
    hum: json["hum"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "room": room,
    "hum": hum,
  };
}

class Pressure {
  Pressure({
    this.room,
    this.pre,
  });

  String room;
  double pre;

  factory Pressure.fromJson(String str) => Pressure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pressure.fromMap(Map<String, dynamic> json) => Pressure(
    room: json["room"],
    pre: json["pre"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "room": room,
    "pre": pre,
  };
}

class Temp {
  Temp({
    this.room,
    this.temp,
  });

  String room;
  double temp;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
    room: json["room"],
    temp: json["temp"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "room": room,
    "temp": temp,
  };
}
