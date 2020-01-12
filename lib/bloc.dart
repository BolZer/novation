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
      yield Initialized(audioPlayer: AudioPlayer(), page: state.page, isInEditMode: state.isInEditMode, sounds: await SoundPadRepository().getAllForPage());
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
      yield PreviousPaged(page: state.page > 1 ? state.page - 1 : state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, audioPlayer: state.audioPlayer);
    }

    if (event is NextPage) {
      yield NextPaged(page: state.page < 6 ? state.page + 1 : state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, audioPlayer: state.audioPlayer);
    }

    if (event is FocusSoundButton) {
      yield SoundButtonFocused(page: state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, focusedSoundButton: event.sound, audioPlayer: state.audioPlayer);
    }

    if (event is UnFocusSoundButton) {
      yield SoundButtonUnFocused(page: state.page, isInEditMode: state.isInEditMode, sounds: state.sounds, focusedSoundButton: null, audioPlayer: state.audioPlayer);
    }

    if (event is CreateSoundPadEntry) {
      SoundPad newSound = SoundPad(id: Uuid().v4(), name: "New SoundPad", soundFilePath: "", colorValue: Colors.blueGrey.value, position: event.position);
      await SoundPadRepository().insert(newSound);
      yield SoundButtonEntryCreated(page: state.page, isInEditMode: true, sounds: await SoundPadRepository().getAllForPage(), focusedSoundButton: state.focusedSoundButton, audioPlayer: state.audioPlayer);
      add(FocusSoundButton(newSound));
    }

    if (event is ChangeFilePathOfFocusedSoundButton) {
      int positionKey = state.sounds.indexOf(state.focusedSoundButton);
      SoundPad relevantSound = state.sounds[positionKey];
      relevantSound.soundFilePath = event.filePath;

      List<SoundPad> newSounds = state.sounds;
      newSounds[positionKey] = relevantSound;

      yield SoundButtonFilePathChanged(page: state.page, isInEditMode: state.isInEditMode, sounds: newSounds, focusedSoundButton: relevantSound, audioPlayer: state.audioPlayer);
    }

    if (event is ChangeNameOfFocusedSoundButton) {
      int positionKey = state.sounds.indexOf(state.focusedSoundButton);
      SoundPad relevantSound = state.sounds[positionKey];
      relevantSound.name = event.name;

      List<SoundPad> newSounds = state.sounds;
      newSounds[positionKey] = relevantSound;

      yield SoundButtonNameChanged(page: state.page, isInEditMode: state.isInEditMode, sounds: newSounds, focusedSoundButton: relevantSound, audioPlayer: state.audioPlayer);
    }

    if (event is ChangeTintOfFocusedSoundButton) {
      List<int> colors = AppConfig.soundButtonColorValues;
      int colorPositionKey = colors.indexOf(state.focusedSoundButton.colorValue);

      int positionKey = state.sounds.indexOf(state.focusedSoundButton);
      SoundPad relevantSound = state.sounds[positionKey];

      if (colorPositionKey == colors.length - 1) {
        relevantSound.colorValue = colors[0];
      }

      if (colorPositionKey < colors.length - 1) {
        relevantSound.colorValue = colors[colorPositionKey + 1];
      }

      List<SoundPad> newSounds = state.sounds;
      newSounds[positionKey] = relevantSound;

      yield SoundButtonTintChanged(page: state.page, isInEditMode: state.isInEditMode, sounds: newSounds, focusedSoundButton: relevantSound, audioPlayer: state.audioPlayer);
    }
  }
}
