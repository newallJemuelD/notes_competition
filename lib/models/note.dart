import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? note;
  @HiveField(2)
  final dynamic createdAt;
  @HiveField(3)
  final String? id;

  Note({this.title, this.note, this.createdAt, this.id});
}
