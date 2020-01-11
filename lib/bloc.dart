import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';

class SoundBarBloc extends Bloc<SoundBoardEvent, SoundBoardState> {
  @override
  SoundBoardState get initialState => Ready(isInEditMode: false);

  @override
  Stream<SoundBoardState> mapEventToState(SoundBoardEvent event) async* {
    if (event is Initialize) {
      yield Initialized(isInEditMode: state.isInEditMode);
    }

    if (event is OpenEditMode) {
      yield EditModeOpened(isInEditMode: true);
    }
  }
}
