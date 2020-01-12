import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_board/entities/Sound.dart';
import 'package:flutter_sound_board/entities/SoundGridPosition.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';
import 'package:uuid/uuid.dart';

class SoundBoardBloc extends Bloc<SoundBoardEvent, SoundBoardState> {
  @override
  SoundBoardState get initialState => Ready(page: 1, isInEditMode: false, sounds: [], focusedSoundButton: null);

  @override
  Stream<SoundBoardState> mapEventToState(SoundBoardEvent event) async* {
    if (event is Initialize) {
      List<Color> colors = [Colors.pinkAccent, Colors.yellowAccent, Colors.blueAccent, Colors.greenAccent];

      yield Initialized(
          page: state.page,
          isInEditMode: state.isInEditMode,
          sounds: List.generate(16, (int index) {
            return Sound(
                id: Uuid().v4(),
                name: "Test",
                colorValue: colors[(new Random()).nextInt(colors.length)].value,
                soundFilePath: "",
                position: SoundGridPosition(
                  page: 1,
                  row: index % 4,
                  column: index ~/ 4,
                ));
          }));
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

    if (event is FocusSoundButton) {
      yield SoundButtonFocused(page: state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, focusedSoundButton: event.sound);
    }

    if (event is UnFocusSoundButton) {
      yield SoundButtonUnFocused(page: state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, focusedSoundButton: null);
    }

    if (event is ChangeTintOfSoundButton) {
      List<int> colors = [Colors.pinkAccent.value, Colors.yellowAccent.value, Colors.blueAccent.value, Colors.greenAccent.value];
      int colorPositionKey = colors.indexOf(state.focusedSoundButton.colorValue);

      int positionKey = state.sounds.indexOf(state.focusedSoundButton);
      Sound relevantSound = state.sounds[positionKey];

      if (colorPositionKey == colors.length - 1) {
        relevantSound.colorValue = colors[0];
      }

      if (colorPositionKey < colors.length - 1) {
        relevantSound.colorValue = colors[colorPositionKey + 1];
      }

      List<Sound> newSounds = state.sounds;
      newSounds[positionKey] = relevantSound;

      yield SoundButtonTintChanged(page: state.page, isInEditMode: state.isInEditMode, sounds: newSounds, focusedSoundButton: relevantSound);
    }
  }
}
