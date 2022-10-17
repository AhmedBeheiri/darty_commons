import 'package:logging/logging.dart';

extension DoubleAnko on double {
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
