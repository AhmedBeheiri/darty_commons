import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

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
          backgroundColor: backgroundColor ?? Colors.white,
          content: Text(
            text,
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
            style: const TextStyle(color: Colors.red),
          ),
          duration: duration,
        ),
      );
    } catch (e) {
      Logger('ErrorSnackBar').severe(e);
    }
  }

  log(String message, {String? tag}) {
    Logger(tag ?? 'StringAnko').log(Level.INFO, this);
  }

  logError(String message, {String? tag}) {
    Logger(tag ?? 'StringAnko').log(Level.SEVERE, this);
  }
}
