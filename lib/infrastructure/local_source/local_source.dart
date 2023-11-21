import 'package:hive_flutter/adapters.dart';

class LocalSource {
  static var box = Hive.box("Mymemory");

  static putInfo(String key, String json) async {
    await box.put(key, json);
  }

  static Future<String> getInfo(String key) async {
    String json = await box.get(key) ?? '';
    return json;
  }

  /// Clear Profile
  static Future<void> clearProfile() async {
    await box.clear();
  }
}
