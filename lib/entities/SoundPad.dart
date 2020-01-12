import 'package:flutter_sound_board/dtos/SoundPadGridPosition.dart';

class SoundPad {
  String id;
  String name;
  String soundFilePath;
  int colorValue;
  SoundPadGridPosition position;

  SoundPad({this.id, this.name, this.soundFilePath, this.colorValue, this.position});

  static SoundPad fromMap(Map<String, dynamic> map) {
    return SoundPad(
      id: map['id'],
      name: map['name'],
      soundFilePath: map['soundFilePath'],
      colorValue: map['colorValue'],
      position: SoundPadGridPosition.fromMap(map['position']),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'soundFilePath': soundFilePath,
        'colorValue': colorValue,
        'position': position.toMap(),
      };

  Map<String, dynamic> toJson() => toMap();
}
