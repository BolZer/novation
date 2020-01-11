import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';
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
    final soundBarBloc = BlocProvider.of<SoundBoardBloc>(context);

    return BlocBuilder<SoundBoardBloc, SoundBoardState>(
      builder: (BuildContext context, SoundBoardState state) {
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
                  onPressed: state.page == 1
                      ? null
                      : () {
                          soundBarBloc.add(PreviousPage());
                        },
                ),
              ),
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(state.page.toString(), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowRight),
                  onPressed: state.page == 6
                      ? null
                      : () {
                          soundBarBloc.add(NextPage());
                        },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.cog),
                  onPressed: () {
                    if (state.isInEditMode) {
                      soundBarBloc.add(CloseEditMode());
                    }

                    if (!state.isInEditMode) {
                      soundBarBloc.add(OpenEditMode());
                    }
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.trash),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
