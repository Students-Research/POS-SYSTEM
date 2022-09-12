import 'package:point_of_sale/core/body/invoices_body.dart';
import 'package:point_of_sale/core/services/auth_service.dart';
import 'package:point_of_sale/locator.dart';

import 'base_responses/base_response.dart';

class InvoicesResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  InvoicesResponse(success, {error, this.accessToken})
      : super(success, error: error);

  /// Named Constructor
  InvoicesResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null)
      locator<AuthService>().invoicesBody = InvoicesBody.fromJson(json);
  }
}
