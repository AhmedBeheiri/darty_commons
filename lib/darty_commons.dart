library darty_commons;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// A Calculator.

extension StringAnko on String {
  void log({String? className}) {
    Logger(className != null ? className : 'StringAnko').log(Level.INFO, this);
  }

  void logError({String? className}) {
    Logger(className != null ? className : 'StringAnko')
        .log(Level.SEVERE, this);
  }

//? String to Int
  int get toInt {
    try {
      return int.parse(this);
    } catch (e) {
      Logger('StringAnko').log(Level.SEVERE, e);
      throw ('Invalid Number');
    }
  }

  //? String to Double
  double get toDouble {
    try {
      return double.parse(this);
    } catch (e) {
      Logger('StringAnko').log(Level.SEVERE, e);
      throw ('Invalid Number');
    }
  }

  //? Show Snack BAr with Passed String as Message

  void showSnackBar(
    BuildContext context, {
    Duration duration = const Duration(milliseconds: 500),
        TextStyle? style,
        Color? backgroundColor,
        TextDirection? direction,
  }) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor?? Colors.white,
          content: Text(
            this,
            textDirection: direction,
            style: style ??TextStyle(color: Colors.white),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('SnackBar').severe(e);
    }
  }
  void showErrorSnackBar(
      BuildContext context, {
        Duration duration = const Duration(milliseconds: 500),
        Color? backgroundColor,
        TextDirection? direction,
      }) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor ?? Colors.white,
          content: Text(
            this,
            textDirection: direction,
            style:TextStyle(color: Colors.red),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('ErrorSnackBar').severe(e);
    }
  }

  /// ? Convert Filepath to Base64
  String get toBase64 {
    File image = File(this);
    List<int> imageBytes = image.readAsBytesSync();
    Logger('toBase64').info(imageBytes);
    return base64Encode(imageBytes);
  }

  /// ? Share Passed Text
  void share({String? subject}) {
    Share.share(this, subject: subject);
  }

  /// ? Send Whats App Message With the passed String as Message Body
  void sendWhatsAppMessage({
    String? phone,
  }) async {
    String url() {
      if (Platform.isIOS) {
        if (phone != null) {
          return "whatsapp://wa.me/$phone?text=${Uri.parse(this)}";
        } else {
          return "whatsapp://wa.me/?text=${Uri.parse(this)}";
        }
      } else {
        if (phone != null) {
          return "whatsapp://send?phone=$phone&text=${Uri.parse(this)}";
        } else {
          return "whatsapp://send?text=${Uri.parse(this)}";
        }
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  ///
  /// * Make Phone Call
  /// ? To Use In Ios Add Add this to your info.plist under dict
  /// ?<key>LSApplicationQueriesSchemes</key>
  ///  ?<array>
  ///     ?<string>tel</string>
  ///   ?</array>

  // void call() async {
  //   try {
  //     bool res = await FlutterPhoneDirectCaller.callNumber(this);
  //     if (!res) {
  //       throw ('Invalid Phone Number');
  //     }
  //   } catch (e) {
  //     Logger('StringAnko').severe('Invalid Phone Number : $e');
  //   }
  // }

  /// ? Dial Phone Number
  void dial() async {
    if (await canLaunch('tel:$this')) {
      launch('tel:$this');
    } else {
      throw ('Invalid Phone Number');
    }
  }

  /// ? Browse the passed String as Link
  void browse() async {
    if (await canLaunch('$this')) {
      launch('$this');
    } else {
      throw ('Invalid Link');
    }
  }

  /// ? Send Email With The Passed String As Email Body
  void email(String to, {String subject = 'New Mail'}) async {
    if (await canLaunch('mailto:$to?subject=$subject&body=$this')) {
      launch('mailto:$to?subject=$subject&body=$this');
    } else {
      throw ('Invalid Email Address');
    }
  }
}

extension FileAnko on File {
  ///? Convert File To Base64
  String get toBase64 {
    List<int> imageBytes = this.readAsBytesSync();
    print(imageBytes);
    return base64Encode(imageBytes);
  }
}

extension ContextAnko on BuildContext {
  ///? Show SnackBar from build context
  void showSnackBar(
      String text, {
        Duration duration = const Duration(milliseconds: 500),
        TextStyle? style,
        Color? backgroundColor,
        TextDirection? direction,
      }) {
    try {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor?? Colors.white,
          content: Text(
            text,
            textDirection: direction,
            style: style ??TextStyle(color: Colors.white),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('SnackBar').severe(e);
    }
  }
  void showErrorSnackBar(
     String text, {
        Duration duration = const Duration(milliseconds: 500),
        Color? backgroundColor,
        TextDirection? direction,
      }) {
    try {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor ?? Colors.white,
          content: Text(
            text,
            textDirection: direction,
            style:TextStyle(color: Colors.red),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('ErrorSnackBar').severe(e);
    }
  }

  log(String message, {String? className}) {
    Logger(className != null ? className : 'StringAnko').log(Level.INFO, this);
  }

  logError(String message, {String? className}) {
    Logger(className != null ? className : 'StringAnko')
        .log(Level.SEVERE, this);
  }
}

extension IntExtension on int {
  /// ? Delay for the passed int value (Specify the required duration [days,hours,minutes,seconds,milliseconds,microseconds])
  delay(
      {FutureOr<dynamic> onCompleted()?,
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

  void log({String? className}) {
    Logger(className != null ? className : 'IntAnko')
        .log(Level.INFO, this.toString());
  }

  void logError({String? className}) {
    Logger(className != null ? className : 'IntAnko')
        .log(Level.SEVERE, this.toString());
  }
}

extension DoubleAnko on double {
  void log({String? className}) {
    Logger(className != null ? className : 'DoubleAnko')
        .log(Level.INFO, this.toString());
  }

  void logError({String? className}) {
    Logger(className != null ? className : 'DoubleAnko')
        .log(Level.SEVERE, this.toString());
  }
}

extension CollectionsExtentsions on List {
  /// ? Add value to list if doesn't exist else replace Current Value
  void addOrReplace(model) {
    if (this.contains(model)) {
      this.insert(this.indexOf(model), model);
      this.removeAt(this.indexOf(model));
    } else {
      this.add(model);
    }
  }

  ///? Set Value At index
  void replace(model, int index) {
    if (index < this.length) {
      this.insert(index, model);
      this.removeAt(this.indexOf(model) + 1);
    } else {
      throw ('Index Out Of Bounds');
    }
  }
}
