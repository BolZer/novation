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
    var itemCount = verticalItemCount * verticalItemCount;

    assert(verticalItemCount % 2 == 0);

    Map<int, List<Widget>> matrix = {
      0: List.generate(itemCount ~/ 4, (int index){
        return Container(
          child: Center(
            child: SoundButton(text: (index + 1).toString(), color: Colors.pinkAccent),
          ),
        );
      }),
      1: List.generate(itemCount ~/ 4, (int index){
        return Container(
          child: Center(
            child: SoundButton(text: (index + 1).toString(), color: Colors.greenAccent),
          ),
        );
      }),
      2: List.generate(itemCount ~/ 4, (int index){
        return Container(
          child: Center(
            child: SoundButton(text: (index + 1).toString(), color: Colors.yellowAccent),
          ),
        );
      }),
      3: List.generate(itemCount ~/ 4, (int index){
        return Container(
          child: Center(
            child: SoundButton(text: (index + 1).toString(), color: Colors.blueAccent),
          ),
        );
      }),
    };

    List<Widget> widgetsList = [];

    matrix.forEach((int key, List<Widget> widgets){
      widgetsList.addAll(widgets);
    });

    var boardPadding = 20.0;
    var crossAxisPadding = 10.0;
    var boardWidth = MediaQuery.of(context).size.width - boardPadding;
    var boardHeight = MediaQuery.of(context).size.height - boardPadding;
    var itemWidth = (boardWidth / verticalItemCount) - crossAxisPadding;
    var mainAxisPadding = (boardHeight / verticalItemCount) - itemWidth;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Center(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(boardPadding),
              crossAxisCount: verticalItemCount,
              crossAxisSpacing: crossAxisPadding,
              mainAxisSpacing: mainAxisPadding,
              children: widgetsList,
            ),
          )),
        ],
      ),
    ));
  }
}
