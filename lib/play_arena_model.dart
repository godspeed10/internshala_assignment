import 'package:meta/meta.dart';
import 'dart:convert';

class PlayArena {
  PlayArena({
    @required this.createOn,
    @required this.updatedOn,
    @required this.id,
    @required this.images,
    @required this.name,
    @required this.dayOfWeeksOpen,
    @required this.openTime,
    @required this.closeTime,
    @required this.slotTimeSize,
    @required this.costPerSlot,
    @required this.sports,
  });

  final DateTime createOn;
  final DateTime updatedOn;
  final int id;
  final List<String> images;
  final String name;
  final List<String> dayOfWeeksOpen;
  final String openTime;
  final String closeTime;
  final int slotTimeSize;
  final double costPerSlot;
  final Sports sports;

  factory PlayArena.fromRawJson(String str) =>
      PlayArena.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayArena.fromJson(Map<String, dynamic> json) => PlayArena(
        createOn: DateTime.parse(json["createOn"]),
        updatedOn: DateTime.parse(json["updatedOn"]),
        id: json["id"],
        images: List<String>.from(json["images"]?.map((x) => x) ?? []),
        name: json["name"],
        dayOfWeeksOpen: List<String>.from(json["dayOfWeeksOpen"].map((x) => x)),
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        slotTimeSize: json["slotTimeSize"],
        costPerSlot: json["costPerSlot"],
        sports: Sports.fromJson(json["sports"]),
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updatedOn": updatedOn.toIso8601String(),
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "name": name,
        "dayOfWeeksOpen": List<dynamic>.from(dayOfWeeksOpen.map((x) => x)),
        "openTime": openTime,
        "closeTime": closeTime,
        "slotTimeSize": slotTimeSize,
        "costPerSlot": costPerSlot,
        "sports": sports.toJson(),
      };
}

class Sports {
  Sports({
    @required this.id,
    @required this.name,
    @required this.iconWhiteUrl,
    @required this.iconBlackUrl,
  });

  final int id;
  final String name;
  final String iconWhiteUrl;
  final String iconBlackUrl;

  factory Sports.fromRawJson(String str) => Sports.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        id: json["id"],
        name: json["name"],
        iconWhiteUrl: json["iconWhiteUrl"],
        iconBlackUrl: json["iconBlackUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconWhiteUrl": iconWhiteUrl,
        "iconBlackUrl": iconBlackUrl,
      };
}
