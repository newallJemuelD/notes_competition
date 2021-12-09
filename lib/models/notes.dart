import 'package:hive/hive.dart';

import 'note.dart';
part 'notes.g.dart';

@HiveType(typeId: 0)
class Notes {
  @HiveField(0)
  List<Note>? notes;

  Notes({this.notes});
}
