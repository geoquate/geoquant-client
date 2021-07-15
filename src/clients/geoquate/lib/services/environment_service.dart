import 'package:geoquate/app/app.logger.dart';
import 'package:geoquate/constants/app_keys.dart';
import 'package:flutter_config/flutter_config.dart';

/// Returns values from the environment read from the .env file
class EnvironmentService {
  final log = getLogger('EnvironmentService');

  Future initialise() async {
    log.i('Load environment');
    // await load(fileName: ".env");
    await FlutterConfig.loadEnvVariables();
    log.v('Environement loaded');
  }

  /// Returns the value associated with the key
  String getValue(String key, {bool verbose = false}) {
    // final value = env[key] ?? NoKey;
    final value = FlutterConfig.get('FABRIC_ID') ?? NoKey;
    if (verbose) log.v('key:$key value:$value');
    return value;
  }
}
