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
    return Container(
      width: 50.0,
      height: 50.0,
      color: widget.color,
    );
  }
}
