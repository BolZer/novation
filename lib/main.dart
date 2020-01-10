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
    var boardPadding = 20.0;
    var crossAxisPadding = 10.0;
    var verticalItemCount = 6;

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
              children: List.generate((verticalItemCount * verticalItemCount), (int index) {

                var itemCount = verticalItemCount * verticalItemCount;
                Color color = null;

                var temp = (index / 3);

                // Top Half
                if(index < itemCount / 2){

                  if((temp < 1) || temp >= 2 && temp < 3 || temp >= 4 && temp < 5){
                    color = Colors.pinkAccent;
                  }else {
                    color = Colors.greenAccent;
                  }
                }

                // Bottom Half
                if(index >= itemCount / 2){

                  if((temp < 7) || temp >= 8 && temp < 9 || temp >= 10 && temp < 11){
                    color = Colors.yellowAccent;
                  }else {
                    color = Colors.blueAccent;
                  }

                }

                return Container(
                  child: Center(
                    child: SoundButton(text: (index + 1).toString(), color:color),
                  ),
                );
              }),
            ),
          )),
        ],
      ),
    ));
  }
}
