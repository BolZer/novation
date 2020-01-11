import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';

class SoundBoardBloc extends Bloc<SoundBoardEvent, SoundBoardState> {
  @override
  SoundBoardState get initialState => Ready(page: 1, isInEditMode: false, sounds: []);

  @override
  Stream<SoundBoardState> mapEventToState(SoundBoardEvent event) async* {
    if (event is Initialize) {
      List<Color> colors = [Colors.pinkAccent, Colors.yellowAccent, Colors.blueAccent, Colors.greenAccent];

      yield Initialized(page: state.page, isInEditMode: state.isInEditMode, sounds: []);
    }

    if (event is OpenEditMode) {
      yield EditModeOpened(page: state.page, isInEditMode: true, sounds: state.sounds);
    }

    if (event is CloseEditMode) {
      yield EditModeClosed(page: state.page, isInEditMode: false, sounds: state.sounds);
    }

    if (event is CloseEditMode) {
      yield EditModeClosed(page: state.page, isInEditMode: false, sounds: state.sounds);
    }

    if (event is PreviousPage) {
      yield PreviousPaged(page: state.page > 1 ? state.page - 1 : state.page, isInEditMode: state.isInEditMode, sounds: state.sounds);
    }

    if (event is NextPage) {
      yield NextPaged(page: state.page < 6 ? state.page + 1 : state.page, isInEditMode: state.isInEditMode, sounds: state.sounds);
    }
  }
}
