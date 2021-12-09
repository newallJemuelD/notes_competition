import 'package:flutter/material.dart';
import 'package:notes_app/styles/styles.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../editable_note_page.dart';
import 'components/search_widget.dart';
import 'package:notes_app/services/global.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<dynamic> searchedNotes;
  String query = "";
  final allNotes = Global.boxes[BOX_NAME.NOTES_BOX]!.values.toList();

  @override
  void initState() {
    super.initState();
    searchedNotes = allNotes;
  }

//search functionality method
  void searchNote(String query) {
    final searchedNotes = allNotes.where((e) {
      final titleLower = e.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.searchedNotes = searchedNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 100,
                child: Flex(
                  direction: Axis.horizontal,
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
                    Expanded(
                      child: SearchWidget(
                        text: query,
                        hintText: 'Enter a search keyword',
                        onChanged: searchNote,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ValueListenableBuilder(
                    valueListenable:
                        Global.boxes[BOX_NAME.NOTES_BOX]!.listenable(),
                    builder: (context, Box box, wid) {
                      if (searchedNotes.length != 0) {
                        return Container(
                          child: ListView.separated(
                            itemCount: searchedNotes.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditableNotePage(
                                          note: searchedNotes[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 70,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              searchedNotes[index].title!,
                                              style: HeaderFonts.tertiaryFont,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              'created at: ${searchedNotes[index].createdAt} ',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                child: Image.asset(
                                    'assets/images/no_search_result.png'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Text(
                                  'Create notes and search for a specific note title here!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
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
