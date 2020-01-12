import 'package:flutter/cupertino.dart';
import 'package:flutter_sound_board/entities/Sound.dart';

@immutable
abstract class SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const SoundBoardState({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton});
}

class Ready extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const Ready({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class Initialized extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const Initialized({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class EditModeOpened extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const EditModeOpened({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class EditModeClosed extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const EditModeClosed({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class NextPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const NextPaged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class PreviousPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const PreviousPaged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class SoundButtonFocused extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const SoundButtonFocused({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class SoundButtonUnFocused extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const SoundButtonUnFocused({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class SoundButtonTintChanged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const SoundButtonTintChanged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class SoundButtonNameChanged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const SoundButtonNameChanged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}

class SoundButtonFilePathChanged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;

  const SoundButtonFilePathChanged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton);
}
