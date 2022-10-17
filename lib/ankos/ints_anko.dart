import 'dart:async';

import 'package:logging/logging.dart';

extension IntExtension on int {
  /* ? Delay for the passed int value (Specify the required duration [days,hours
   ,minutes,seconds,milliseconds,microseconds]) */
  delay(
      {FutureOr<dynamic> Function()? onCompleted,
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

  void log({String? tag}) {
    Logger(tag ?? 'TAG').log(Level.INFO, this);
  }

  void logError({String? tag}) {
    Logger(tag ?? 'TAG').log(Level.SEVERE, this);
  }

  void logWarning({String? tag}) {
    Logger(tag ?? 'TAG').log(Level.WARNING, this);
  }
}
