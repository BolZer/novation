import 'package:flutter/cupertino.dart';
import 'package:flutter_sound_board/entities/Sound.dart';

@immutable
abstract class SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const SoundBoardState({this.page, this.isInEditMode, this.sounds});
}

class Ready extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const Ready({this.page, this.isInEditMode, this.sounds}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds);
}

class Initialized extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const Initialized({this.page, this.isInEditMode, this.sounds}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds);
}

class EditModeOpened extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const EditModeOpened({this.page, this.isInEditMode, this.sounds}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds);
}

class EditModeClosed extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const EditModeClosed({this.page, this.isInEditMode, this.sounds}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds);
}

class NextPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const NextPaged({this.page, this.isInEditMode, this.sounds}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds);
}

class PreviousPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;

  const PreviousPaged({this.page, this.isInEditMode, this.sounds}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds);
}
