import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_board/bloc.dart';
import 'package:flutter_sound_board/event.dart';
import 'package:flutter_sound_board/state.dart';
import 'package:flutter_sound_board/widgets/SoundBoard.dart';
import 'package:flutter_sound_board/widgets/SoundBoardToolbar.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSoundBoarBloc extends MockBloc<SoundBoardEvent, SoundBoardState> implements SoundBoardBloc {}

void main() {
  group('Testing Soundboard Screen', () {
    SoundBoardBloc soundBoardBloc;

    setUp(() {
      soundBoardBloc = MockSoundBoarBloc();
    });

    tearDown(() {
      soundBoardBloc?.close();
    });

    testWidgets('Test the Main Widget to display tiles', (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (BuildContext context) => soundBoardBloc,
        child: MaterialApp(
          title: 'SB',
          theme: ThemeData.dark(),
          home: SoundBoard(),
        ),
      ));
      expect(find.byType(SoundBoardToolbar), findsOneWidget);
    });
  });
}
