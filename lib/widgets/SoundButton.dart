import 'package:flutter/material.dart';

class SoundButton extends StatefulWidget {
  final String text;
  final Color color;
  final bool isInEditMode;

  SoundButton({Key key, @required this.text, this.color, this.isInEditMode = false}) : super(key: key);

  @override
  _SoundButtonState createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Test")));
          },
          child: Container(
            constraints: constraints,
            width: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            height: constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth,
            color: widget.color,
          ),
        );
      },
    );
  }
}
