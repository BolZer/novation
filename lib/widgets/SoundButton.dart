import 'package:flutter/material.dart';
import 'package:flutter_sound_board/entities/Sound.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundButton extends StatefulWidget {
  final Sound sound;
  final bool isInEditMode;
  final Function onTap;

  SoundButton({Key key, this.sound, this.isInEditMode = false, this.onTap}) : super(key: key);

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
            constraints: constraints,
            width: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            height: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            color: widget.sound != null ? Color(widget.sound.colorValue) : Colors.grey,
            child: widget.isInEditMode ? this.editIconDisplay : null,
          ),
        );
      },
    );
  }

  Widget get editIconDisplay {
    return FittedBox(
      fit: BoxFit.none,
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            FontAwesomeIcons.wrench,
            size: 20.0,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
