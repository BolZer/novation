import 'package:equatable/equatable.dart';
import 'package:flutter_sound_board/entities/Sound.dart';

abstract class SoundBoardEvent extends Equatable {
  SoundBoardEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class Initialize extends SoundBoardEvent {
  Initialize() : super();
}

class OpenEditMode extends SoundBoardEvent {
  OpenEditMode() : super();
}

class CloseEditMode extends SoundBoardEvent {
  CloseEditMode() : super();
}

class NextPage extends SoundBoardEvent {
  NextPage() : super();
}

class PreviousPage extends SoundBoardEvent {
  PreviousPage() : super();
}

class FocusSoundButton extends SoundBoardEvent {
  final Sound sound;

  FocusSoundButton(this.sound) : super();
}

class UnFocusSoundButton extends SoundBoardEvent {
  final Sound sound;

  UnFocusSoundButton(this.sound) : super();
}

class ChangeNameOfFocusedSoundButton extends SoundBoardEvent {
  final String name;

  ChangeNameOfFocusedSoundButton(this.name) : super();
}

class ChangeTintOfFocusedSoundButton extends SoundBoardEvent {
  ChangeTintOfFocusedSoundButton() : super();
}
