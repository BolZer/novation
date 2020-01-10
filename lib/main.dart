import 'package:flutter/material.dart';
import 'package:flutter_sound_board/widgets/SoundButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    var verticalItemCount = 6;
    var verticalItemCountQuadrant = verticalItemCount / 2;
    var itemCount = verticalItemCount * verticalItemCount;

    assert(verticalItemCount % 2 == 0);

    var crossAxisPadding = 5.0;
    var quadrantPadding = crossAxisPadding / 2;

    var boardWidth = MediaQuery.of(context).size.width;
    var boardHeight = MediaQuery.of(context).size.height;

    var quadrantWidth = boardWidth / 4;
    var quadrantHeight = boardHeight / 4;

    var itemWidth = (quadrantWidth / quadrantHeight) - crossAxisPadding;
    var mainAxisPadding = (quadrantHeight / verticalItemCountQuadrant) - itemWidth;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: verticalItemCountQuadrant.toInt(),
                  crossAxisSpacing: crossAxisPadding,
                  mainAxisSpacing: mainAxisPadding,
                  padding: EdgeInsets.symmetric(horizontal: quadrantPadding, vertical: 0.0),
                  children: this._getQuadrantFixture(itemCount ~/ 4, Colors.pinkAccent),
                  shrinkWrap: true,
                )),
                Expanded(
                    child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: verticalItemCountQuadrant.toInt(),
                  crossAxisSpacing: crossAxisPadding,
                  mainAxisSpacing: mainAxisPadding,
                  padding: EdgeInsets.symmetric(horizontal: quadrantPadding, vertical: 0.0),
                  children: this._getQuadrantFixture(itemCount ~/ 4, Colors.greenAccent),
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
                  crossAxisCount: verticalItemCountQuadrant.toInt(),
                  crossAxisSpacing: crossAxisPadding,
                  mainAxisSpacing: mainAxisPadding,
                  padding: EdgeInsets.symmetric(horizontal: quadrantPadding, vertical: 0.0),
                  children: this._getQuadrantFixture(itemCount ~/ 4, Colors.yellowAccent),
                  shrinkWrap: true,
                )),
                Expanded(
                    child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: verticalItemCountQuadrant.toInt(),
                  crossAxisSpacing: crossAxisPadding,
                  mainAxisSpacing: mainAxisPadding,
                  padding: EdgeInsets.symmetric(horizontal: quadrantPadding, vertical: 0.0),
                  children: this._getQuadrantFixture(itemCount ~/ 4, Colors.lightBlueAccent),
                  shrinkWrap: true,
                )),
              ],
            ),
          ),
        ],
      ),
    ));
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
