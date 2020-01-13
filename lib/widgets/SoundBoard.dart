import 'dart:io' as io;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/dtos/SoundPadGridPosition.dart';
import 'package:flutter_sound_board/entities/SoundPad.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';
import 'package:flutter_sound_board/widgets/SoundBoardToolbar.dart';
import 'package:flutter_sound_board/widgets/SoundPad.dart';

class SoundBoard extends StatefulWidget {
  SoundBoard({Key key}) : super(key: key);

  @override
  _SoundBoardState createState() => _SoundBoardState();
}

class _SoundBoardState extends State<SoundBoard> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final soundBoardBloc = BlocProvider.of<SoundBoardBloc>(context);

    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    return BlocBuilder<SoundBoardBloc, SoundBoardState>(
      builder: (BuildContext context, SoundBoardState state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 2, child: SoundBoardToolbar()),
              Expanded(
                flex: 10,
                child: Column(
                  children: List.generate(4, (int index) {
                    return Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                SoundPad sound = _getSoundForPosition(state.sounds, SoundPadGridPosition(page: state.page, row: index, column: 0));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundPadGridPosition(page: state.page, row: index, column: 0));
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                SoundPad sound = _getSoundForPosition(state.sounds, SoundPadGridPosition(page: state.page, row: index, column: 1));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundPadGridPosition(page: state.page, row: index, column: 1));
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                SoundPad sound = _getSoundForPosition(state.sounds, SoundPadGridPosition(page: state.page, row: index, column: 2));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundPadGridPosition(page: state.page, row: index, column: 2));
                              }(),
                            ),
                          ),
                          if (!useMobileLayout)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: () {
                                  SoundPad sound = _getSoundForPosition(state.sounds, SoundPadGridPosition(page: state.page, row: index, column: 3));
                                  return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundPadGridPosition(page: state.page, row: index, column: 3));
                                }(),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  SoundPad _getSoundForPosition(List<SoundPad> sounds, SoundPadGridPosition position) {
    if (sounds.length == 0) {
      return null;
    }

    var filteredSound = sounds.where((SoundPad sound) {
      return sound.position.page == position.page && sound.position.column == position.column && sound.position.row == position.row;
    }).toList();

    if (filteredSound.length == 0) {
      return null;
    }

    return filteredSound.first;
  }

  SoundPadWidget _createSoundButtonForPosition(SoundPad sound, SoundBoardState state, SoundBoardBloc soundBoardBloc, SoundPadGridPosition position) {
    return SoundPadWidget(
      soundPad: sound,
      isInEditMode: state.isInEditMode,
      isFocused: sound != null && state.focusedSoundButton != null && state.focusedSoundButton.id == sound.id,
      onTap: () async {
        if (state.isInEditMode && sound == null) {
          soundBoardBloc.add(CreateSoundPadEntry(position));
        }

        if (!state.isInEditMode && sound == null) {
          return;
        }

        if (state.isInEditMode && (state.focusedSoundButton == null || state.focusedSoundButton.id != sound.id)) {
          soundBoardBloc.add(FocusSoundButton(sound));
        }

        if (state.isInEditMode && (state.focusedSoundButton != null && state.focusedSoundButton.id == sound.id)) {
          soundBoardBloc.add(UnFocusSoundButton(sound));
        }

        if (!state.isInEditMode && sound.soundFilePath != "" && !await io.File(sound.soundFilePath).exists()) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('File for Sound Pad not found. Please select a new sound file for pad')));
          return;
        }

        if (!state.isInEditMode && sound.soundFilePath != "" && state.audioPlayer.state == AudioPlayerState.PLAYING) {
          state.audioPlayer.stop();
        }

        if (!state.isInEditMode && sound.soundFilePath != "") {
          state.audioPlayer.play(sound.soundFilePath, isLocal: true);
        }
      },
    );
  }
}
