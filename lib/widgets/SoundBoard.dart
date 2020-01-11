import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sound_board/widgets/SoundButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundBoard extends StatefulWidget {
  final int verticalItemCount;
  final double crossAxisPadding;
  final double mainAxisPadding;

  SoundBoard({Key key, @required this.verticalItemCount, @required this.crossAxisPadding, @required this.mainAxisPadding}) : super(key: key);

  @override
  _SoundBoardState createState() => _SoundBoardState();
}

class _SoundBoardState extends State<SoundBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.githubSquare, size: 35.0),
                    Expanded(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.arrowLeft),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text("1"),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.arrowRight),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.wrench),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 10,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SoundButton(
                            text: 1.toString(),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
