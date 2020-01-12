import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/dtos/SoundGridPosition.dart';
import 'package:flutter_sound_board/entities/Sound.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';
import 'package:flutter_sound_board/widgets/SoundBoardToolbar.dart';
import 'package:flutter_sound_board/widgets/SoundButton.dart';

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
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc);
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 1));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc);
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 2));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc);
                              }(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: () {
                                Sound sound = _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 3));
                                return _createSoundButtonForPosition(sound, state, soundBoardBloc);
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

    return sounds.where((Sound sound) {
      return sound.position.page == position.page && sound.position.column == position.column && sound.position.row == position.row;
    }).first;
  }

  SoundButton _createSoundButtonForPosition(Sound sound, SoundBoardState state, SoundBoardBloc soundBoardBloc) {
    return SoundButton(
      sound: sound,
      isInEditMode: state.isInEditMode,
      isFocused: sound != null && state.focusedSoundButton != null && state.focusedSoundButton.id == sound.id,
      onTap: () {
        if (sound == null) {
          return;
        }

        if (state.isInEditMode && (state.focusedSoundButton == null || state.focusedSoundButton.id != sound.id)) {
          soundBoardBloc.add(FocusSoundButton(sound));
        }

        if (state.isInEditMode && (state.focusedSoundButton != null && state.focusedSoundButton.id == sound.id)) {
          soundBoardBloc.add(UnFocusSoundButton(sound));
        }
      },
    );
  }
}
