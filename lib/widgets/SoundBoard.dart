import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
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
                                color: Colors.pinkAccent,
                                isInEditMode: state.isInEditMode,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SoundButton(
                                color: Colors.pinkAccent,
                                isInEditMode: state.isInEditMode,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SoundButton(
                                color: Colors.greenAccent,
                                isInEditMode: state.isInEditMode,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: SoundButton(
                                color: Colors.greenAccent,
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
}
