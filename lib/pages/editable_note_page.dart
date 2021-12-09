import 'package:flutter/material.dart';

import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/global.dart';

class EditableNotePage extends StatefulWidget {
  final Note? note;
  EditableNotePage({this.note});

  @override
  _DetailNotePageState createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<EditableNotePage> {
  TextEditingController? editableContent;
  TextEditingController? editableTitle;

  bool editMode = false;

  @override
  void initState() {
    super.initState();
    editableContent = TextEditingController(text: widget.note!.note);
    editableTitle = TextEditingController(text: widget.note!.title);
  }

  @override
  void dispose() {
    editableContent!.dispose();
    editableTitle!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
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
                          setState(() {
                            editMode = true;
                          });
                        },
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff3B3B3B),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Global.boxes[BOX_NAME.NOTES_BOX]!.put(
                                  widget.note!.id!,
                                  Note(
                                    title: widget.note!.title!,
                                    note: editableContent!.text,
                                    createdAt: widget.note!.createdAt,
                                    id: widget.note!.id!,
                                  ));
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.save),
                          )),
                    ),
                  ],
                ),
              ),
              editMode == true
                  ? Container(
                      padding: EdgeInsets.fromLTRB(30, 18, 30, 0),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: editableTitle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.note!.title!,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              editMode == true
                  ? Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: editableContent,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.note!.note!,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
