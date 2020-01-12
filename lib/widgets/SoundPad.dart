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
        return Material(
          color: widget.soundPad != null ? Color(widget.soundPad.colorValue) : Colors.grey,
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: widget.isFocused ? Colors.white70 : Color(widget.soundPad != null ? widget.soundPad.colorValue : Colors.transparent.value), width: 5.0),
              ),
              constraints: constraints,
              width: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
              height: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
              child: widget.isInEditMode ? this.editIconDisplay : this.iconDisplay,
            ),
          ),
        );
      },
    );
  }

  Widget get iconDisplay {
    return Column(
      children: <Widget>[
        if (widget.soundPad != null)
          Expanded(
            child: Center(
              child: FittedBox(
                child: Text(widget.soundPad.name, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          )
      ],
    );
  }

  Widget get editIconDisplay {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: FittedBox(
            fit: BoxFit.none,
            child: Icon(
              FontAwesomeIcons.wrench,
              size: 25.0,
            ),
          ),
        ),
        if (widget.soundPad != null)
          Expanded(
            flex: 5,
            child: Center(
              child: FittedBox(
                child: Text(widget.soundPad.name, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          )
      ],
    );
  }
}
