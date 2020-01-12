import 'package:equatable/equatable.dart';
import 'package:flutter_sound_board/dtos/SoundPadGridPosition.dart';
import 'package:flutter_sound_board/entities/SoundPad.dart';

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
  final SoundPad sound;

  FocusSoundButton(this.sound) : super();
}

class UnFocusSoundButton extends SoundBoardEvent {
  final SoundPad sound;

  UnFocusSoundButton(this.sound) : super();
}

class ChangeNameOfFocusedSoundButton extends SoundBoardEvent {
  final String name;

  ChangeNameOfFocusedSoundButton(this.name) : super();
}

class ChangeTintOfFocusedSoundButton extends SoundBoardEvent {
  ChangeTintOfFocusedSoundButton() : super();
}

class ChangeFilePathOfFocusedSoundButton extends SoundBoardEvent {
  final String filePath;

  ChangeFilePathOfFocusedSoundButton(this.filePath) : super();
}

class CreateSoundPadEntry extends SoundBoardEvent {
  final SoundPadGridPosition position;

  CreateSoundPadEntry(this.position) : super();
}

class DeleteSoundPadEntry extends SoundBoardEvent {
  final SoundPad soundPad;

  DeleteSoundPadEntry(this.soundPad) : super();
}

class UpdateSoundPadEntry extends SoundBoardEvent {
  final SoundPad soundPad;

  UpdateSoundPadEntry(this.soundPad) : super();
}
