import 'package:flutter/material.dart';
import 'package:flutter_sound_board/entities/Sound.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundButton extends StatefulWidget {
  final Sound sound;
  final bool isInEditMode;
  final bool isFocused;
  final Function onTap;

  SoundButton({Key key, this.sound, this.isInEditMode = false, this.isFocused = false, this.onTap}) : super(key: key);

  @override
  _SoundButtonState createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              border: widget.isFocused ? Border.all(color: Colors.white70, width: 5.0) : null,
              color: widget.sound != null ? Color(widget.sound.colorValue) : Colors.grey,
            ),
            constraints: constraints,
            width: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            height: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            child: widget.isInEditMode ? this.editIconDisplay : null,
          ),
        );
      },
    );
  }

  Widget get editIconDisplay {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Icon(
            FontAwesomeIcons.wrench,
            size: 25.0,
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(widget.sound.name, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
