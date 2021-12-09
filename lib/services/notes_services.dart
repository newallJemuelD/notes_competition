import 'package:notes_app/models/note.dart';
import 'global.dart';

class NotesService {
  static saveNotesLocally(Note note) {
    Global.boxes[BOX_NAME.NOTES_BOX]!.put(note.id, note);
  }

  static deleteSingleNote(String id) {
    Global.boxes[BOX_NAME.NOTES_BOX]!.delete(id);
  }
}
