import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/entities/Sound.dart';
import 'package:flutter_sound_board/entities/SoundGridPosition.dart';
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
                              child: SoundButton(
                                sound: _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 0)),
                                isInEditMode: state.isInEditMode,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SoundButton(
                                sound: _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 1)),
                                isInEditMode: state.isInEditMode,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SoundButton(
                                sound: _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 2)),
                                isInEditMode: state.isInEditMode,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SoundButton(
                                sound: _getSoundForPosition(state.sounds, SoundGridPosition(page: state.page, row: index, column: 3)),
                                isInEditMode: state.isInEditMode,
                              ),
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
}
