import 'package:flutter_sound_board/entities/SoundGridPosition.dart';

class Sound {
  String id;
  String name;
  String soundFilePath;
  int colorValue;
  SoundGridPosition position;

  Sound({this.id, this.name, this.soundFilePath, this.colorValue, this.position});
}
