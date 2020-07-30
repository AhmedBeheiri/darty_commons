library dart_commons;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// A Calculator.

extension StringAnko on String {
  void log({String className}) {
    Logger(className != null ? className : 'StringAnko').log(Level.INFO, this);
  }

  void logError({String className}) {
    Logger(className != null ? className : 'StringAnko').log(Level.SEVERE, this);
  }

  int get toInt {
    try {
      return int.parse(this);
    } catch (e) {
      Logger('StringAnko').log(Level.SEVERE, e);
      throw ('Invalid Number');
    }
  }

  double get toDouble {
    try {
      return double.parse(this);
    } catch (e) {
      Logger('StringAnko').log(Level.SEVERE, e);
      throw ('Invalid Number');
    }
  }

  void ShowSnackBar(
    BuildContext context, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    try {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            this,
            style: TextStyle(color: Colors.white),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('SnackBar').severe(e);
    }
  }

  String get toBase64 {
    File image = File(this);
    List<int> imageBytes = image.readAsBytesSync();
    print(imageBytes);
    return base64Encode(imageBytes);
  }
}

extension FileAnko on File {
  String get toBase64 {
    List<int> imageBytes = this.readAsBytesSync();
    print(imageBytes);
    return base64Encode(imageBytes);
  }
}

extension ContextAnko on BuildContext {
  void ShowSnackBar(
    String text, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    try {
      Scaffold.of(this).showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('SnackBar').severe(e);
    }
  }
}

extension IntExtension on int {
  delay(
      {Function onCompleted,
      bool days = false,
      bool hours = false,
      bool minutes = false,
      bool seconds = false,
      bool milliseconds = false,
      bool microseconds = false}) {
    Future.delayed(
        Duration(
            days: days ? this : 0,
            seconds: seconds ? this : 0,
            milliseconds: milliseconds ? this : 0,
            minutes: minutes ? this : 0,
            hours: hours ? this : 0,
            microseconds: microseconds ? this : 0),
        onCompleted);
  }

  void log({String className}) {
    Logger(className != null ? className : 'IntAnko').log(Level.INFO, this.toString());
  }

  void logError({String className}) {
    Logger(className != null ? className : 'IntAnko').log(Level.SEVERE, this.toString());
  }
}

extension DoubleAnko on double {
  void log({String className}) {
    Logger(className != null ? className : 'DoubleAnko').log(Level.INFO, this.toString());
  }

  void logError({String className}) {
    Logger(className != null ? className : 'DoubleAnko').log(Level.SEVERE, this.toString());
  }
}

main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  'aaa'.log(className: 'Main');
  300.delay(
      onCompleted: () {
        'entered'.log();
      },
      milliseconds: true);
  print('900'.toInt);
  print('900'.toDouble);
//  Scaffold(
//    body: Builder(builder: (context) {
//      'asdas'.ShowSnackBar(context);
//      return Container();
//    }),
//  );
}
