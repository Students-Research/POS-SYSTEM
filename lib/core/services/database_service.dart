import 'dart:convert';
import 'package:point_of_sale/core/body/login.dart';
import 'package:point_of_sale/core/response/invoices_respones.dart';
import 'package:point_of_sale/core/response/login_response.dart';
import 'package:point_of_sale/core/response/single_invoice_response.dart';
import 'package:point_of_sale/core/services/api_services.dart';
import '../../locator.dart';
import '../response/auth_response.dart';
import '../response/base_responses/request_response.dart';

class DatabaseService {
  final ApiServices _apiServices = locator<ApiServices>();

  // Future<UserProfileResponse> getUserProfile() async {
  //   final RequestResponse response =
  //       await _apiServices.get(endPoint: EndPoints.userProfile);
  //   return UserProfileResponse.fromJson(response.data);
  // }

  Future<LoginResponse> loginWithEmail(String email) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: 'login',
      data: {
        "email": email,
      },
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<InvoicesResponse> getInvoiceData({int? id, String? email}) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: 'get_invoices',
      data: {
        "email": email,
        "id": id,
      },
    );
    return InvoicesResponse.fromJson(response.data);
  }

  Future<SingleInvoicesResponse> getProductDetails(
      {int? id, String? email}) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: 'get_single_invoice',
      data: {
        "email": email,
        "id": id,
      },
    );
    return SingleInvoicesResponse.fromJson(response.data);
  }

  ///
  /// Sign up with google
  ///
  // Future<AuthResponse> loginWithGoogle(String accessToken) async {
  //   final RequestResponse response = await _apiServices.post(
  //     endPoint: EndPoints.loginWithGoogle,
  //     data: {'accessToken': accessToken},
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  ///
  /// Sign up with facebook
  ///

}
