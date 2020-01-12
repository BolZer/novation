import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/dtos/SoundGridPadPosition.dart';
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

    return BlocBuilder<SoundBoardBloc, SoundBoardState>(
      builder: (BuildContext context, SoundBoardState state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 1, child: SoundBoardToolbar()),
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
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 0));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundGridPosition(page: state.page, row: index, column: 0));
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 1));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundGridPosition(page: state.page, row: index, column: 1));
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 2));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundGridPosition(page: state.page, row: index, column: 2));
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 3));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc, SoundGridPosition(page: state.page, row: index, column: 3));
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

  Sound _getSoundForPosition(List<Sound> sounds, SoundGridPosition position) {
    if (sounds.length == 0) {
      return null;
    }

    var filteredSound = sounds.where((Sound sound) {
      return sound.position.page == position.page && sound.position.column == position.column && sound.position.row == position.row;
    }).toList();

    if (filteredSound.length == 0) {
      return null;
    }

    return filteredSound.first;
  }

  SoundButton _createSoundButtonForPosition(Sound sound, SoundBoardState state, SoundBoardBloc soundBoardBloc, SoundGridPosition position) {
    return SoundButton(
      sound: sound,
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
