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
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: widget.isFocused ? Colors.white70 : Color(widget.sound != null ? widget.sound.colorValue : Colors.grey.value), width: 5.0),
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
