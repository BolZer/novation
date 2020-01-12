import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_board/config.dart';
import 'package:flutter_sound_board/entities/SoundPad.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/repositories/SoundPadRepository.dart';
import 'package:flutter_sound_board/state.dart';
import 'package:uuid/uuid.dart';

class SoundBoardBloc extends Bloc<SoundBoardEvent, SoundBoardState> {
  @override
  SoundBoardState get initialState => Ready(page: 1, isInEditMode: false, sounds: [], focusedSoundButton: null);

  @override
  Stream<SoundBoardState> mapEventToState(SoundBoardEvent event) async* {
    if (event is Initialize) {
      yield Initialized(audioPlayer: AudioPlayer(), page: state.page, isInEditMode: state.isInEditMode, sounds: await SoundPadRepository().getAllForPage(state.page));
    }

    if (event is OpenEditMode) {
      yield EditModeOpened(page: state.page, isInEditMode: true, sounds: state.sounds, audioPlayer: state.audioPlayer);
    }

    if (event is CloseEditMode) {
      yield EditModeClosed(page: state.page, isInEditMode: false, sounds: state.sounds, audioPlayer: state.audioPlayer);
    }

    if (event is CloseEditMode) {
      yield EditModeClosed(page: state.page, isInEditMode: false, sounds: state.sounds, audioPlayer: state.audioPlayer);
    }

    if (event is PreviousPage) {
      var newPageCount = state.page > 1 ? state.page - 1 : state.page;
      yield PreviousPaged(page: newPageCount, isInEditMode: state.isInEditMode, sounds: await SoundPadRepository().getAllForPage(newPageCount), audioPlayer: state.audioPlayer);
    }

    if (event is NextPage) {
      var newPageCount = state.page < 6 ? state.page + 1 : state.page;
      yield NextPaged(page: newPageCount, isInEditMode: state.isInEditMode, sounds: await SoundPadRepository().getAllForPage(newPageCount), audioPlayer: state.audioPlayer);
    }

    if (event is FocusSoundButton) {
      yield SoundButtonFocused(page: state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, focusedSoundButton: event.sound, audioPlayer: state.audioPlayer);
    }

    if (event is UnFocusSoundButton) {
      yield SoundButtonUnFocused(page: state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, focusedSoundButton: null, audioPlayer: state.audioPlayer);
    }

    if (event is CreateSoundPadEntry) {
      SoundPad newSound = SoundPad(id: Uuid().v4(), name: "New Sound", soundFilePath: "", colorValue: Colors.blueGrey.value, position: event.position);
      await SoundPadRepository().insert(newSound);
      yield SoundButtonEntryCreated(page: state.page, isInEditMode: true, sounds: await SoundPadRepository().getAllForPage(state.page), focusedSoundButton: state.focusedSoundButton, audioPlayer: state.audioPlayer);
      add(FocusSoundButton(newSound));
    }

    if (event is DeleteSoundPadEntry) {
      await SoundPadRepository().delete(event.soundPad);
      yield SoundButtonEntryCreated(page: state.page, isInEditMode: true, sounds: await SoundPadRepository().getAllForPage(state.page), focusedSoundButton: null, audioPlayer: state.audioPlayer);
    }

    if (event is UpdateSoundPadEntry) {
      await SoundPadRepository().update(event.soundPad);
      yield SoundButtonEntryCreated(page: state.page, isInEditMode: true, sounds: await SoundPadRepository().getAllForPage(state.page), focusedSoundButton: state.focusedSoundButton, audioPlayer: state.audioPlayer);
    }

    if (event is ChangeFilePathOfFocusedSoundButton) {
      SoundPad relevantSound = state.focusedSoundButton;
      relevantSound.soundFilePath = event.filePath;

      yield state;
      add(UpdateSoundPadEntry(relevantSound));
    }

    if (event is ChangeNameOfFocusedSoundButton) {
      SoundPad relevantSound = state.focusedSoundButton;
      relevantSound.name = event.name;

      yield state;
      add(UpdateSoundPadEntry(relevantSound));
    }

    if (event is ChangeTintOfFocusedSoundButton) {
      List<int> colors = AppConfig.soundButtonColorValues;
      int colorPositionKey = colors.indexOf(state.focusedSoundButton.colorValue);

      SoundPad relevantSound = state.focusedSoundButton;

      if (colorPositionKey == colors.length - 1) {
        relevantSound.colorValue = colors[0];
      }

      if (colorPositionKey < colors.length - 1) {
        relevantSound.colorValue = colors[colorPositionKey + 1];
      }

      yield state;
      add(UpdateSoundPadEntry(relevantSound));
    }
  }
}
