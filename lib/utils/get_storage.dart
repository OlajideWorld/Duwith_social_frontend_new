import 'package:get_storage/get_storage.dart';

class GetStorageClass {
  final box = GetStorage();

// Save a string value
  void saveString(String key, String value) {
    box.write(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return box.read(key);
  }

  // Save an integer value
  void saveInt(String key, int value) {
    box.write(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return box.read(key);
  }

  // Save a double value
  void saveDouble(String key, double value) {
    box.write(key, value);
  }

  // Get a double value
  double? getDouble(String key) {
    return box.read(key);
  }

  // Save a boolean value
  void saveBool(String key, bool value) {
    box.write(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return box.read(key);
  }

  // Save a map
  void saveMap(String key, Map<String, dynamic> value) {
    box.write(key, value);
  }

  // Get a map
  Map<String, dynamic>? getMap(String key) {
    return box.read(key);
  }

  // Remove a value
  void removeValue(String key) {
    box.remove(key);
  }

  // Clear all stored values
  void clearAll() {
    box.erase();
  }
}
