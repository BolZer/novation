import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SoundBoardState extends Equatable {
  final bool isInEditMode;

  const SoundBoardState({this.isInEditMode});

  @override
  List<Object> get props => [isInEditMode];
}

class Ready extends SoundBoardState {
  final bool isInEditMode;

  const Ready({this.isInEditMode}) : super(isInEditMode: isInEditMode);
}

class Initialized extends SoundBoardState {
  final bool isInEditMode;

  const Initialized({this.isInEditMode}) : super(isInEditMode: isInEditMode);
}

class EditModeOpened extends SoundBoardState {
  final bool isInEditMode;

  const EditModeOpened({this.isInEditMode}) : super(isInEditMode: isInEditMode);
}
