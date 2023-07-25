import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/entities.dart';
import '../values/constant.dart';

/// This `StorageService` used to store data applications.
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

  /// This used to saving boolean value
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  /// This used to saving string value
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  /// This used to read data from the storage through `SharedPreferences`.
  /// We only required to pass the key only.
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  /// This used to read data from the storage through `SharedPreferences`
  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  /// Remove previous data from the storage through `SharedPreferences`.
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  /// This method is used to get user profile information.
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

  /// This method is used to get user token key.
  String getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? '';
  }
}
