import 'package:flutter/material.dart';
import 'package:flutter_sound_board/widgets/SoundButton.dart';
import 'package:flutter_sound_board/widgets/TextPlaceholder.dart';

class SoundBoard extends StatefulWidget {
  final int verticalItemCount;
  final double crossAxisPadding;
  final double mainAxisPadding;

  SoundBoard({Key key, @required this.verticalItemCount, @required this.crossAxisPadding, @required this.mainAxisPadding}) : super(key: key);

  @override
  _SoundBoardState createState() => _SoundBoardState();
}

class _SoundBoardState extends State<SoundBoard> {
  int get _verticalItemCountForQuadrant {
    return (widget.verticalItemCount / 2).floor().toInt();
  }

  int get _totalItemCount {
    return (widget.verticalItemCount * widget.verticalItemCount).floor().toInt();
  }

  double get _quadrantPadding {
    return widget.crossAxisPadding / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            TextPlaceholder(),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: _verticalItemCountForQuadrant,
                                    crossAxisSpacing: widget.crossAxisPadding,
                                    mainAxisSpacing: widget.mainAxisPadding,
                                    padding: EdgeInsets.symmetric(horizontal: _quadrantPadding, vertical: 0.0),
                                    children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.pinkAccent),
                                    shrinkWrap: true,
                                  )),
                                  Expanded(
                                      child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: _verticalItemCountForQuadrant,
                                    crossAxisSpacing: widget.crossAxisPadding,
                                    mainAxisSpacing: widget.mainAxisPadding,
                                    padding: EdgeInsets.symmetric(horizontal: _quadrantPadding, vertical: 0.0),
                                    children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.greenAccent),
                                    shrinkWrap: true,
                                  )),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: _verticalItemCountForQuadrant,
                                    crossAxisSpacing: widget.crossAxisPadding,
                                    mainAxisSpacing: widget.mainAxisPadding,
                                    padding: EdgeInsets.symmetric(horizontal: _quadrantPadding, vertical: 0.0),
                                    children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.yellowAccent),
                                    shrinkWrap: true,
                                  )),
                                  Expanded(
                                      child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: _verticalItemCountForQuadrant,
                                    crossAxisSpacing: widget.crossAxisPadding,
                                    mainAxisSpacing: widget.mainAxisPadding,
                                    padding: EdgeInsets.symmetric(horizontal: _quadrantPadding, vertical: 0.0),
                                    children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.lightBlueAccent),
                                    shrinkWrap: true,
                                  )),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: TextPlaceholder(),
            )
          ],
        )
      ],
    );
  }

  List<Widget> _getQuadrantFixture(int count, Color color) {
    return List.generate(count, (int index) {
      return Container(
        child: Center(
          child: SoundButton(text: (index + 1).toString(), color: color),
        ),
      );
    });
  }
}
