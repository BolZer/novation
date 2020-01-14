import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/state.dart';
import 'package:flutter_sound_board/widgets/SoundBoard.dart';
import 'package:flutter_sound_board/widgets/SoundBoardToolbar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing Soundboard Screen', () {
    SoundBoardBloc soundBoardBloc;

    setUp(() {
      soundBoardBloc = SoundBoardBloc();
    });

    tearDown(() {
      soundBoardBloc?.close();
    });

    test('initial state is correct', (){
      expect(soundBoardBloc.initialState, Ready(page: 1, isInEditMode: false, sounds: [], focusedSoundButton: null));
    });

    testWidgets('Test the Main Widget to display tiles', (WidgetTester tester) async {
      
      whenListen(soundBoardBloc,  Stream.value(Ready(page: 1, isInEditMode: false, sounds: [], focusedSoundButton: null, audioPlayer: AudioPlayer())));

      await tester.pumpWidget(BlocProvider(
        create: (BuildContext context) => soundBoardBloc,
        child: new MediaQuery(
            data: new MediaQueryData(),
            child: new MaterialApp(home: SoundBoard())
        )
      ));

      expect(find.byType(SoundBoardToolbar), findsOneWidget);
    });
  });
}
