import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/notes.dart';

class HiveInstance {
  static Box? _notesBox;

  static initialiseHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    Hive.registerAdapter(NotesAdapter());

    _notesBox = await Hive.openBox('notes_box');
  }

  static Box get notesBox {
    return _notesBox!;
  }
}
