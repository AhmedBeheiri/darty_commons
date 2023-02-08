import 'dart:async';

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

  void log(String message,
      {String? tag, Object? error, StackTrace? stackTrace, Zone? zone}) {
    Logger(tag ?? 'TAG').log(Level.INFO, message, error, stackTrace, zone);
  }

  void logError(String message,
      {String? tag, Object? error, StackTrace? stackTrace, Zone? zone}) {
    Logger(tag ?? 'TAG').log(Level.SEVERE, message, error, stackTrace, zone);
  }

  void logWarning(String message,
      {String? tag, Object? error, StackTrace? stackTrace, Zone? zone}) {
    Logger(tag ?? 'TAG').log(Level.WARNING, message, error, stackTrace, zone);
  }

  void logOther(String message,
      {String? tag,
      required Level level,
      Object? error,
      StackTrace? stackTrace,
      Zone? zone}) {
    Logger(tag ?? 'TAG').log(level, message, error, stackTrace, zone);
  }
}
