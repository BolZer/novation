import 'dart:convert';

import 'package:flutter_sound_board/entities/SoundPad.dart';
import 'package:flutter_sound_board/service/Database.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

class SoundPadRepository {
  static const String SOUND_STORE_NAME = 'sounds';
  final _soundStore = StoreRef(SOUND_STORE_NAME);

  Future<Database> get _database async => await AppDatabase.instance.database;

  Future<void> insert(SoundPad sound) async {
    sound.id = new Uuid().v4();
    await _soundStore.record(sound.id).add(await _database, jsonEncode(sound));
  }

  Future<void> delete(SoundPad sound) async {
    await _soundStore.record(sound.id).delete(await _database);
  }

  Future<void> update(SoundPad sound) async {
    await _soundStore.record(sound.id).put(await _database, jsonEncode(sound));
  }

  Future<List<SoundPad>> getAllForPage() async {
    final records = await _soundStore.find(
      await _database,
      finder: Finder(),
    );

    return records.map((snapshot) {
      return SoundPad.fromMap(jsonDecode(snapshot.value));
    }).toList();
  }
}
