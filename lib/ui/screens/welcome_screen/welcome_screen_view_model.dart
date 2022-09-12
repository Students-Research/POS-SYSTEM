import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/core/services/auth_service.dart';

import '../../../locator.dart';

class WelcomeScreenViewModel extends ChangeNotifier {
  WelcomeScreenViewModel(this.email);
  String email;
  late Widget list;
  AuthService authService = locator<AuthService>();
  final log = Logger();

  getWelcomeData() async {
    log.d("requestLogin  :: $email");
    try {
      final response = await authService.loginWithEmail(email);
      if (response.success) {
        //Get.off(() => HomeScreen());
        log.d("getWelcomeData  :: ${authService.logInDataBody.toJson()}");
        return response;
      } else {
        Fluttertoast.showToast(msg: '${response.error}');
      }
    } catch (e, s) {
      log.d("@getWelcomeData  Exceptions : $e");
      log.d(s);
    }
  }
}
