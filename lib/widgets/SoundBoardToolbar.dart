import 'package:flutter/material.dart';

class SoundBoardToolbar extends StatefulWidget {
  final String text;
  final Color color;

  SoundBoardToolbar({Key key, @required this.text, this.color}) : super(key: key);

  @override
  _SoundBoardToolbarState createState() => _SoundBoardToolbarState();
}

class _SoundBoardToolbarState extends State<SoundBoardToolbar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          width: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
          height: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
          color: widget.color,
        );
      },
    );
  }
}
