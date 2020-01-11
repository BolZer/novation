import 'package:flutter/material.dart';
import 'package:flutter_sound_board/widgets/SoundButton.dart';

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: (width < height ? width : height) - kToolbarHeight,
                height: (width < height ? width : height) - kToolbarHeight,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: _verticalItemCountForQuadrant,
                          crossAxisSpacing: widget.crossAxisPadding,
                          mainAxisSpacing: widget.mainAxisPadding,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, widget.crossAxisPadding / 2, widget.mainAxisPadding / 2),
                          children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.pinkAccent),
                          shrinkWrap: true,
                        )),
                        Expanded(
                            child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: _verticalItemCountForQuadrant,
                          crossAxisSpacing: widget.crossAxisPadding,
                          mainAxisSpacing: widget.mainAxisPadding,
                          padding: EdgeInsets.fromLTRB(widget.crossAxisPadding / 2, 0.0, 0.0, widget.mainAxisPadding / 2),
                          children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.greenAccent),
                          shrinkWrap: true,
                        )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: _verticalItemCountForQuadrant,
                          crossAxisSpacing: widget.crossAxisPadding,
                          mainAxisSpacing: widget.mainAxisPadding,
                          padding: EdgeInsets.fromLTRB(0.0, widget.mainAxisPadding / 2, widget.crossAxisPadding / 2, 0.0),
                          children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.pinkAccent),
                          shrinkWrap: true,
                        )),
                        Expanded(
                            child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: _verticalItemCountForQuadrant,
                          crossAxisSpacing: widget.crossAxisPadding,
                          mainAxisSpacing: widget.mainAxisPadding,
                          padding: EdgeInsets.fromLTRB(widget.crossAxisPadding / 2, widget.mainAxisPadding / 2, 0.0, 0.0),
                          children: this._getQuadrantFixture(_totalItemCount ~/ 4, Colors.greenAccent),
                          shrinkWrap: true,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _getQuadrantFixture(int count, Color color) {
    return List.generate(count, (int index) {
      return SoundButton(text: (index + 1).toString(), color: color);
    });
  }
}
