import 'package:flutter/material.dart';

import 'package:notes_app/pages/search_page/search_page.dart';
import 'package:notes_app/styles/styles.dart';
import 'package:notes_app/pages/home_page/components/change_theme_button_widget.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TopBarWidgetState createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Notes',
              style: HeaderFonts.primaryFont,
              textAlign: TextAlign.start,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xff3B3B3B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: PopupMenuButton(
              icon: Icon(Icons.settings),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Container(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text('Light mode'),
                        Spacer(),
                        ChangeThemeButtonWidget(),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          'Grid view',
                        ),
                        Spacer(),
                        Switch.adaptive(value: false, onChanged: null),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
