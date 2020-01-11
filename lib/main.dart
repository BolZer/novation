import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/widgets/SoundBoard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SoundBarBloc(),
      child: MaterialApp(
        title: 'SB',
        theme: ThemeData.dark(),
        home: Main(),
      ),
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
    // ignore: close_sinks
    final soundBarBloc = BlocProvider.of<SoundBarBloc>(context);

    soundBarBloc.add(Initialize());

    return Scaffold(body: SoundBoard());
  }
}
