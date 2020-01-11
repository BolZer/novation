import 'package:flutter/material.dart';
import 'package:flutter_sound_board/entities/Sound.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundButton extends StatefulWidget {
  final Sound sound;
  final bool isInEditMode;

  SoundButton({Key key, this.sound, this.isInEditMode = false}) : super(key: key);

  @override
  _SoundButtonState createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: widget.sound != null
              ? () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Test")));
                }
              : null,
          child: Container(
            constraints: constraints,
            width: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            height: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            color: widget.sound != null ? Color(widget.sound.colorValue) : Colors.grey,
            child: widget.isInEditMode ? Icon(FontAwesomeIcons.wrench) : null,
          ),
        );
      },
    );
  }
}
