import 'package:flutter/material.dart';

import 'package:notes_app/pages/splash_page.dart';
import 'package:notes_app/services/hive.dart';
import 'package:notes_app/services/theme_provider.dart';
import 'package:notes_app/styles/styles.dart';
import 'package:provider/provider.dart';

void main() async {
  await HiveInstance.initialiseHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          home: SplashPage(),
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
        );
      });
}
