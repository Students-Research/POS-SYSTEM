import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/core/body/login.dart';
import 'package:point_of_sale/ui/screens/product_screen/product_screen.dart';

import '../../../core/services/auth_service.dart';
import '../../../locator.dart';

class InvoiceScreenViewModel extends ChangeNotifier {
  late Widget list;
  AuthService authService = locator<AuthService>();
  final log = Logger();

  getInvoiceData(LogInBody body) async {
    log.d("requestLogin  :: ${body.email}");
    try {
      final response = await authService.getInvoiceData(
          id: body.id, email: authService.userEmail);
      if (response.success) {
        //Get.off(() => HomeScreen());
        log.d("getInvoiceData  :: ${authService.invoicesBody.toJson()}");
        return response;
      } else {
        Fluttertoast.showToast(msg: '${response.error}');
      }
    } catch (e, s) {
      log.d("@getInvoiceData  Exceptions : $e");
      log.d(s);
    }
  }

  getProductDetails({int? id}) async {
    log.d("requestLogin  :: ${id}  ${authService.userEmail}");
    try {
      final response = await authService.getProductDetails(
          id: id, email: authService.userEmail);
      if (response.success) {
        Get.to(() => Product(
              singleInvoicesBody: authService.singleInvoicesBody,
            ));
        log.d("getProductDetails  :: ${authService.invoicesBody.toJson()}");
      } else {
        Fluttertoast.showToast(msg: '${response.error}');
      }
    } catch (e, s) {
      log.d("@getProductDetails  Exceptions : $e");
      log.d(s);
    }
  }
}
