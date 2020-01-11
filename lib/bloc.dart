import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';

class SoundBoardBloc extends Bloc<SoundBoardEvent, SoundBoardState> {
  @override
  SoundBoardState get initialState => Ready(page: 1, isInEditMode: false);

  @override
  Stream<SoundBoardState> mapEventToState(SoundBoardEvent event) async* {
    if (event is Initialize) {
      yield Initialized(page: state.page, isInEditMode: state.isInEditMode);
    }

    if (event is OpenEditMode) {
      yield EditModeOpened(page: state.page, isInEditMode: true);
    }

    if (event is CloseEditMode) {
      yield EditModeClosed(page: state.page, isInEditMode: false);
    }

    if (event is CloseEditMode) {
      yield EditModeClosed(page: state.page, isInEditMode: false);
    }

    if (event is PreviousPage) {
      yield PreviousPaged(page: state.page > 1 ? state.page - 1 : state.page, isInEditMode: state.isInEditMode);
    }

    if (event is NextPage) {
      yield NextPaged(page: state.page < 6 ? state.page + 1 : state.page, isInEditMode: state.isInEditMode);
    }
  }
}
