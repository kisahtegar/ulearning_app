// ignore_for_file: constant_identifier_names

/// Constants used throughout the application.
class AppConstants {
  /// Key for storing whether the device has been opened for the first time.
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';

  /// Key for storing the user's profile data.
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile_key';

  /// Key for storing the user's authentication token.
  static const String STORAGE_USER_TOKEN_KEY = 'user_token_key';

  /// The URL of the server's API.
  static const String SERVER_API_URL = 'http://192.168.0.15:8000/';

  // Example of using ngrok for testing:
  // static const String SERVER_API_URL = ' https://4ad4-111-94-125-180.ngrok-free.app/';

  /// The URL for accessing uploaded files on the server.
  static const String SERVER_UPLOADS = '${SERVER_API_URL}uploads/';
}
