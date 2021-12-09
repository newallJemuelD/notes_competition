import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/editable_note_page.dart';
import 'package:notes_app/services/global.dart';
import 'package:notes_app/services/notes_services.dart';
import 'package:notes_app/styles/styles.dart';

class AllNotesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Global.boxes[BOX_NAME.NOTES_BOX]!.listenable(),
      builder: (context, Box box, wid) {
        List<Note> notesFromHive = List<Note>.from(box.values);
        if (notesFromHive.length != 0) {
          return Container(
            // color: Colors.grey[300],
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemCount: notesFromHive.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditableNotePage(note: notesFromHive[index]),
                      ),
                    );
                  },
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 70,
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notesFromHive[index].title!,
                                style: HeaderFonts.tertiaryFont,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'created at: ${notesFromHive[index].createdAt} ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              NotesService.deleteSingleNote(
                                  notesFromHive[index].id!);
                            },
                            child: Container(
                              child: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Hero(
                  tag: 'splash',
                  child: Container(
                    child: Image.asset('assets/images/splash.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Create your first note!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}
