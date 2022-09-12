import 'package:point_of_sale/core/body/single_invoices_body.dart';
import 'package:point_of_sale/core/services/auth_service.dart';
import 'package:point_of_sale/locator.dart';

import 'base_responses/base_response.dart';

class SingleInvoicesResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  SingleInvoicesResponse(success, {error, this.accessToken})
      : super(success, error: error);

  /// Named Constructor
  SingleInvoicesResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null)
      locator<AuthService>().singleInvoicesBody =
          SingleInvoicesBody.fromJson(json['body']);
  }
}
