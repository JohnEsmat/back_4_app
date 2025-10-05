import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ParseConfig {
  static const keyApplicationId = 'c6MV65sMW8bovSKfAcmD5unAX2fFhyTlUwyq2gN0';
  static const keyClientKey = '30nhmKFkToAA5YtiyYZqWaK5aanKFTMwqkGv4nV0';
  static const keyParseServerUrl = 'https://parseapi.back4app.com';

  static Future<void> initializeParse() async {
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      debug: true,
    );
  }
}
