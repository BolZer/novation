import 'package:file_picker/file_picker.dart';
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
    final soundBoardBloc = BlocProvider.of<SoundBoardBloc>(context);

    return BlocBuilder<SoundBoardBloc, SoundBoardState>(
      builder: (BuildContext context, SoundBoardState state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.isInEditMode ? this._getWidgetListForWhenInEditMode(soundBoardBloc, state) : this._getWidgetListForWhenNotInEditMode(soundBoardBloc, state),
          ),
        );
      },
    );
  }

  List<Widget> _getWidgetListForWhenInEditMode(SoundBoardBloc soundBoardBloc, SoundBoardState state) {
    return [
      Expanded(
        child: IconButton(
          icon: Icon(FontAwesomeIcons.cog),
          onPressed: () {
            soundBoardBloc.add(CloseEditMode());
          },
        ),
      ),
      Expanded(
        child: IconButton(
            icon: Icon(FontAwesomeIcons.tint),
            onPressed: state.focusedSoundButton == null
                ? null
                : () {
                    soundBoardBloc.add(ChangeTintOfFocusedSoundButton());
                  }),
      ),
      Expanded(
        child: IconButton(
            icon: Icon(FontAwesomeIcons.fileSignature),
            onPressed: state.focusedSoundButton == null
                ? null
                : () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController controller = TextEditingController(text: state.focusedSoundButton.name);

                          return AlertDialog(
                            title: Text("Name this Sound Button"),
                            content: TextField(
                              controller: controller,
                            ),
                            actions: <Widget>[
                              RaisedButton(
                                child: Text('Submit'),
                                onPressed: () {
                                  soundBoardBloc.add(ChangeNameOfFocusedSoundButton(controller.text));
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  }),
      ),
      Expanded(
        child: IconButton(
            icon: Icon(FontAwesomeIcons.music),
            onPressed: state.focusedSoundButton == null
                ? null
                : () {
                    FilePicker.getFilePath(fileExtension: 'mp3').then((String filePath) {
                      soundBoardBloc.add(ChangeFilePathOfFocusedSoundButton(filePath));
                    });
                  }),
      ),
      Expanded(
        child: IconButton(
            icon: Icon(FontAwesomeIcons.trash),
            onPressed: state.focusedSoundButton == null
                ? null
                : () {
                    soundBoardBloc.add(DeleteSoundPadEntry(state.focusedSoundButton));
                  }),
      ),
    ];
  }

  List<Widget> _getWidgetListForWhenNotInEditMode(SoundBoardBloc soundBoardBloc, SoundBoardState state) {
    return [
      Expanded(
        child: IconButton(
          icon: Icon(FontAwesomeIcons.cog),
          onPressed: () {
            soundBoardBloc.add(OpenEditMode());
          },
        ),
      ),
      Expanded(
        child: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: state.page == 1
              ? null
              : () {
                  soundBoardBloc.add(PreviousPage());
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
                  soundBoardBloc.add(NextPage());
                },
        ),
      ),
      Expanded(
        child: Image(
          height: 45.0,
          width: 45.0,
          fit: BoxFit.contain,
          image: AssetImage('assets/logo.png'),
        ),
      ),
    ];
  }
}
