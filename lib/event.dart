import 'package:equatable/equatable.dart';

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
