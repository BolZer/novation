import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sound_board/entities/SoundPad.dart';

@immutable
abstract class SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundBoardState({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer});
}

class Ready extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const Ready({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class Initialized extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const Initialized({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class EditModeOpened extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const EditModeOpened({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class EditModeClosed extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const EditModeClosed({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class NextPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const NextPaged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class PreviousPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const PreviousPaged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class SoundButtonFocused extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundButtonFocused({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class SoundButtonUnFocused extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundButtonUnFocused({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class SoundButtonTintChanged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundButtonTintChanged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class SoundButtonNameChanged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundButtonNameChanged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class SoundButtonFilePathChanged extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundButtonFilePathChanged({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}

class SoundButtonEntryCreated extends SoundBoardState {
  final int page;
  final bool isInEditMode;
  final List<Sound> sounds;
  final Sound focusedSoundButton;
  final AudioPlayer audioPlayer;

  const SoundButtonEntryCreated({this.page, this.isInEditMode, this.sounds, this.focusedSoundButton, this.audioPlayer}) : super(page: page, isInEditMode: isInEditMode, sounds: sounds, focusedSoundButton: focusedSoundButton, audioPlayer: audioPlayer);
}
