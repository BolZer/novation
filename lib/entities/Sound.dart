import 'package:flutter_sound_board/entities/SoundGridPosition.dart';

class Sound {
  final String id;
  final String name;
  final String soundFilePath;
  final String colorValue;
  final SoundGridPosition position;

  Sound({this.id, this.name, this.soundFilePath, this.colorValue, this.position});
}
