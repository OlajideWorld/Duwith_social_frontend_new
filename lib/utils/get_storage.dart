import 'package:get_storage/get_storage.dart';

class GetStorageClass {
  final box = GetStorage();

// Save a string value
  Future<void> saveString(String key, String value) async {
    await box.write(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return box.read(key);
  }

  // Save an integer value
  Future<void> saveInt(String key, int value) async {
    await box.write(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return box.read(key);
  }

  // Save a double value
  Future<void> saveDouble(String key, double value) async {
    await box.write(key, value);
  }

  // Get a double value
  double? getDouble(String key) {
    return box.read(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    await box.write(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return box.read(key);
  }

  // Save a map
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    await box.write(key, value);
  }

  // Get a map
  Map<String, dynamic>? getMap(String key) {
    return box.read(key);
  }

  // Remove a value
  Future<void> removeValue(String key) async {
    await box.remove(key);
  }

  // Clear all stored values
  void clearAll() {
    box.erase();
  }
}
