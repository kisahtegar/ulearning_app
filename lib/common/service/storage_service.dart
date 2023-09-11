import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/entities.dart';
import '../values/constant.dart';

/// A service for managing data storage using `SharedPreferences`.
class StorageService {
  /// `SharedPreferences` is used for storing data key-value pair in the Android
  /// and iOS. `SharedPreference` let you read and write key-value pair in a couple
  /// of lines easily. But always remember, shared preference is not a solution
  /// for you to keep complex relational data.
  late final SharedPreferences _prefs;

  /// This should be working as a `Singleton`, This will make sure that
  /// your class has only one instance, and in this case `_prefs` is only
  /// instance that will have. But of course we'll have a global pointer to
  /// it and pointer would be covering when we globally initialize it.
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  /// Saves a boolean value with the specified key.
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  /// Saves a string value with the specified key.
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  /// Checks if the device has been opened for the first time.
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  /// Checks if a user is logged in.
  bool getIsLoggedIn() {
    // TODO: check this code
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) != null;
  }

  /// Removes data associated with a specific key.
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  /// Retrieves the user's profile information from storage.
  UserItem getUserProfile() {
    // this come from local storage data.
    var profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';
    // jsonDecode will formating data profileOffline is string to json.
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }

    // if empty return UserItem empty object.
    return UserItem();
  }

  /// Retrieves the user's authentication token.
  String getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? '';
  }
}
