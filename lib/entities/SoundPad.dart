import 'dart:convert';

import 'package:flutter_sound_board/dtos/SoundGridPadPosition.dart';

class Sound {
  String id;
  String name;
  String soundFilePath;
  int colorValue;
  SoundGridPosition position;

  Sound({this.id, this.name, this.soundFilePath, this.colorValue, this.position});

  static Sound fromMap(Map<String, dynamic> map) {
    return Sound(
      id: map['id'],
      name: map['name'],
      soundFilePath: map['soundFilePath'],
      colorValue: map['colorValue'],
      position: SoundGridPosition.fromMap(jsonDecode(map['position'])),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'soundFilePath': soundFilePath,
        'colorValue': colorValue,
        'position': jsonEncode(position),
      };

  Map<String, dynamic> toJson() => toMap();
}
