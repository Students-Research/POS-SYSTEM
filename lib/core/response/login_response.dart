import 'package:point_of_sale/core/body/login.dart';
import 'package:point_of_sale/core/services/auth_service.dart';
import 'package:point_of_sale/locator.dart';

import 'base_responses/base_response.dart';

class LoginResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  LoginResponse(success, {error, this.accessToken})
      : super(success, error: error);

  /// Named Constructor
  LoginResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null)
      locator<AuthService>().logInDataBody =
          LogInDataBody.fromJson(json['body']);
  }
}
