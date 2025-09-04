import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences _sharedPreferences;

  const LocalStorage(this._sharedPreferences);

  // ------------------ SET methods ------------------

  Future<bool> setInt(String key, int value) => _sharedPreferences.setInt(key, value);

  Future<bool> setDouble(String key, double value) => _sharedPreferences.setDouble(key, value);

  Future<bool> setBool(String key, bool value) => _sharedPreferences.setBool(key, value);

  Future<bool> setString(String key, String value) => _sharedPreferences.setString(key, value);

  Future<bool> setStringList(String key, List<String> value) => _sharedPreferences.setStringList(key, value);

  // ------------------ GET methods ------------------

  int? getInt(String key) => _sharedPreferences.getInt(key);

  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  bool? getBool(String key) => _sharedPreferences.getBool(key);

  String? getString(String key) => _sharedPreferences.getString(key);

  List<String>? getStringList(String key) => _sharedPreferences.getStringList(key);

  // ------------------ Utility methods ------------------

  bool containsKey(String key) => _sharedPreferences.containsKey(key);

  Future<bool> remove(String key) => _sharedPreferences.remove(key);

  Future<bool> clear() => _sharedPreferences.clear();

  Set<String> getKeys() => _sharedPreferences.getKeys();
}