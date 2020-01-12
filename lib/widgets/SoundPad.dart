import 'package:flutter/material.dart';
import 'package:flutter_sound_board/entities/SoundPad.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundPadWidget extends StatefulWidget {
  final SoundPad soundPad;
  final bool isInEditMode;
  final bool isFocused;
  final Function onTap;

  SoundPadWidget({Key key, this.soundPad, this.isInEditMode = false, this.isFocused = false, this.onTap}) : super(key: key);

  @override
  _SoundPadWidgetState createState() => _SoundPadWidgetState();
}

class _SoundPadWidgetState extends State<SoundPadWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: widget.isFocused ? Colors.white70 : Color(widget.soundPad != null ? widget.soundPad.colorValue : Colors.grey.value), width: 5.0),
              color: widget.soundPad != null ? Color(widget.soundPad.colorValue) : Colors.grey,
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
        if (widget.soundPad != null)
          Expanded(
            flex: 2,
            child: Center(
              child: Text(widget.soundPad.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
      ],
    );
  }
}