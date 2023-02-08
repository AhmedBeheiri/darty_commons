import 'dart:async';

import 'package:logging/logging.dart';

extension DoubleAnko on double {
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
}
