import 'package:flutter/cupertino.dart';

@immutable
abstract class SoundBoardState {
  final int page;
  final bool isInEditMode;

  const SoundBoardState({this.page, this.isInEditMode});
}

class Ready extends SoundBoardState {
  final int page;
  final bool isInEditMode;

  const Ready({this.page, this.isInEditMode}) : super(page: page, isInEditMode: isInEditMode);
}

class Initialized extends SoundBoardState {
  final int page;
  final bool isInEditMode;

  const Initialized({this.page, this.isInEditMode}) : super(page: page, isInEditMode: isInEditMode);
}

class EditModeOpened extends SoundBoardState {
  final int page;
  final bool isInEditMode;

  const EditModeOpened({this.page, this.isInEditMode}) : super(page: page, isInEditMode: isInEditMode);
}

class EditModeClosed extends SoundBoardState {
  final int page;
  final bool isInEditMode;

  const EditModeClosed({this.page, this.isInEditMode}) : super(page: page, isInEditMode: isInEditMode);
}

class NextPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;

  const NextPaged({this.page, this.isInEditMode}) : super(page: page, isInEditMode: isInEditMode);
}

class PreviousPaged extends SoundBoardState {
  final int page;
  final bool isInEditMode;

  const PreviousPaged({this.page, this.isInEditMode}) : super(page: page, isInEditMode: isInEditMode);
}
