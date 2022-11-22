import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hn/topArticleList.dart';

final materialThemeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.blue.shade600),
    primaryColor: Colors.orange,
    secondaryHeaderColor: Colors.orangeAccent,
    canvasColor: Colors.blue,
    backgroundColor: Colors.red,
    // textTheme: TextTheme().copyWith(body1: TextTheme().body1)
    );
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.deepOrangeAccent,
    barBackgroundColor: Colors.deepOrangeAccent,
    scaffoldBackgroundColor: Colors.white);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 1. The first option hides the debug banner on the toolbar.
      // debugShowCheckedModeBanner: false,
      // material: (_, __)  => MaterialAppData(theme: materialThemeData),
      // cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),
      home: TopArticleList(),
    );
  }
}

