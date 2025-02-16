

import 'package:dotenv/dotenv.dart';

class Environment {

  static final DotEnv _env = DotEnv();

  static void load() {
    _env.load();
  }

  static String get baseUrlLocal => _env['BaseUrlLocal'] ?? '';
}
