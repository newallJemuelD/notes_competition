import 'package:flutter/material.dart';

import 'package:notes_app/services/utils.dart';
import 'components/content_widget.dart';
import 'components/title_widget.dart';
import 'components/top_action_bar.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _SingleNotePageState createState() => _SingleNotePageState();
}

class _SingleNotePageState extends State<CreateNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String id = Utils.getSecureString(20);
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              TopActionBar(
                  titleController: titleController,
                  contentController: contentController,
                  date: date,
                  id: id),
              TitleWidget(titleController: titleController),
              ContentWidget(contentController: contentController),
            ],
          ),
        ),
      ),
    );
  }
}
