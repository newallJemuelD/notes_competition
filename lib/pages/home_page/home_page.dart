import 'package:flutter/material.dart';
import 'package:notes_app/pages/create_note_page/create_note_page.dart';
import 'package:notes_app/services/utils.dart';

import 'components/all_notes_list_widget.dart';
import 'components/top_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int containerCount = 0;
  String id = Utils.getSecureString(20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                child: TopBarWidget(),
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: AllNotesListWidget(),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).iconTheme.color,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateNotePage()));
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
