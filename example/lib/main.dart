import 'dart:io';
import 'package:darty_commons/dart_commons.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'test_widget.dart';

void main() {
  runApp(MyApp());
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

final GlobalKey<NavigatorState> mainNavigatorKey =
    GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.ShowSnackBar('text',
        duration: Duration(milliseconds: 500));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.blue, buttonColor: Color(0xFF5796ff)),
      home: TestWidget(),
    );
  }
}
