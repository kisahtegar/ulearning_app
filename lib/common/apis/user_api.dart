import '../entities/entities.dart';
import '../utils/http_util.dart';

/// A class for interacting with the User API.
class UserApi {
  /// Logs in the user by sending login credentials to the server.
  ///
  /// - [params] : The request parameters for user login.
  ///
  /// Returns a [UserLoginResponseEntity] with user login information.
  // TODO: need to be checked for the changes
  static Future<UserLoginResponseEntity> login({
    LoginRequestEntity? params,
  }) async {
    // Send a POST request to the 'api/login' endpoint with the provided parameters.
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );
    // debugPrint(response.toString());

    // Return the parsed response data as a UserLoginResponseEntity.
    return UserLoginResponseEntity.fromJson(response);
  }
}
