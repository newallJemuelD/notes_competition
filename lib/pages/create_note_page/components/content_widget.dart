import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.contentController,
  }) : super(key: key);

  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: contentController,
        maxLines: null,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(30),
          hintText: 'Enter text',
        ),
      ),
    );
  }
}
