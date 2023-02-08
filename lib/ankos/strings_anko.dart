import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringAnko on String {
  void log({String? tag, Object? error, StackTrace? stackTrace, Zone? zone}) {
    Logger(tag ?? 'TAG').log(Level.INFO, this, error, stackTrace, zone);
  }

  void logError(
      {String? tag, Object? error, StackTrace? stackTrace, Zone? zone}) {
    Logger(tag ?? 'TAG').log(Level.SEVERE, this, error, stackTrace, zone);
  }

  void logWarning(
      {String? tag, Object? error, StackTrace? stackTrace, Zone? zone}) {
    Logger(tag ?? 'TAG').log(Level.WARNING, this, error, stackTrace, zone);
  }

  void logOther(
      {String? tag,
      required Level level,
      Object? error,
      StackTrace? stackTrace,
      Zone? zone}) {
    Logger(tag ?? 'TAG').log(level, this, error, stackTrace, zone);
  }

//? String to Int
  int get toInt {
    try {
      return int.parse(this);
    } catch (e) {
      Logger('StringAnko').log(Level.SEVERE, e);
      throw Exception('Invalid Number');
    }
  }

  //? String to Double
  double get toDouble {
    try {
      return double.parse(this);
    } catch (e) {
      Logger('StringAnko').log(Level.SEVERE, e);
      throw Exception('Invalid Number');
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
          backgroundColor: backgroundColor ?? Colors.white,
          content: Text(
            this,
            textDirection: direction,
            style: style ?? const TextStyle(color: Colors.white),
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
            style: const TextStyle(color: Colors.red),
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
          return 'whatsapp://wa.me/$phone?text=${Uri.parse(this)}';
        } else {
          return 'whatsapp://wa.me/?text=${Uri.parse(this)}';
        }
      } else {
        if (phone != null) {
          return 'whatsapp://send?phone=$phone&text=${Uri.parse(this)}';
        } else {
          return 'whatsapp://send?text=${Uri.parse(this)}';
        }
      }
    }

    if (await canLaunchUrl(
      Uri.parse(url()),
    )) {
      await launchUrl(Uri.parse(url()));
    } else {
      throw Exception('Could not launchUrl ${url()}');
    }
  }

  /// ? Dial Phone Number
  void dial() async {
    if (await canLaunchUrl(Uri.parse('tel:$this'))) {
      launchUrl(Uri.parse('tel:$this'));
    } else {
      throw Exception('Invalid Phone Number');
    }
  }

  /// ? Browse the passed String as Link
  void browse() async {
    if (await canLaunchUrl(Uri.parse(this))) {
      launchUrl(Uri.parse(this));
    } else {
      throw Exception('Invalid Link');
    }
  }

  /// ? Send Email With The Passed String As Email Body
  void email(String to, {String subject = 'New Mail'}) async {
    if (await canLaunchUrl(
        Uri.parse('mailto:$to?subject=$subject&body=$this'))) {
      launchUrl(Uri.parse('mailto:$to?subject=$subject&body=$this'));
    } else {
      throw Exception('Invalid Email Address');
    }
  }
}
