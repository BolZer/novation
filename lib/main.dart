import 'package:flutter/material.dart';
import 'package:flutter_sound_board/widgets/SoundBoard.dart';

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
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SoundBoard(
          verticalItemCount: 8,
          crossAxisPadding: 5.0,
          mainAxisPadding: 5.0,
        ),
      ),
    ));
  }
}
