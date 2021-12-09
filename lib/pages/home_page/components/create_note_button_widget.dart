import 'package:flutter/material.dart';

import 'package:notes_app/pages/create_note_page/create_note_page.dart';

class AddNotesButtonWidget extends StatefulWidget {
  @override
  _AddNotesButtonWidgetState createState() => _AddNotesButtonWidgetState();
}

class _AddNotesButtonWidgetState extends State<AddNotesButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.cyan[400],
      // onPressed:widget.onTap,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateNotePage()));
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
