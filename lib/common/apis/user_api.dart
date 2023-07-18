import '../entities/entities.dart';
import '../utils/http_util.dart';

/// This class is used for User API.
class UserApi {
  /// This method used to login the user into database.
  static login({LoginRequestEntity? params}) async {
    // This respose = response.data after the post method returns
    // which is this will return json data from server.
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );
    // debugPrint(response.toString());
    return UserLoginResponseEntity.fromJson(response);
  }
}
