import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/notes_services.dart';

class TopActionBar extends StatelessWidget {
  const TopActionBar({
    Key? key,
    required this.titleController,
    required this.contentController,
    required this.date,
    required this.id,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController contentController;
  final DateTime date;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xff3B3B3B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              iconSize: 30,
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Spacer(),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xff3B3B3B),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  if (titleController.text != '' ||
                      contentController.text != '') {
                    NotesService.saveNotesLocally(
                      Note(
                        title: titleController.text,
                        note: contentController.text,
                        createdAt: DateFormat('EEEE').format(date),
                        id: id,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.save),
              )),
        ],
      ),
    );
  }
}
