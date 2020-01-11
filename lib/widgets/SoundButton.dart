import 'package:flutter/material.dart';

class SoundButton extends StatefulWidget {
  final String text;
  final Color color;

  SoundButton({Key key, @required this.text, this.color}) : super(key: key);

  @override
  _SoundButtonState createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          color: widget.color,
        );
      },
    );
  }
}
