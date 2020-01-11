import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundBoardToolbar extends StatefulWidget {
  SoundBoardToolbar({Key key}) : super(key: key);

  @override
  _SoundBoardToolbarState createState() => _SoundBoardToolbarState();
}

class _SoundBoardToolbarState extends State<SoundBoardToolbar> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final soundBarBloc = BlocProvider.of<SoundBarBloc>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.cover,
            child: Icon(FontAwesomeIcons.githubSquare, size: 40.0),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Center(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text("1", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.arrowRight),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.cog),
              onPressed: () {
                soundBarBloc.add(OpenEditMode());
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.times),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
