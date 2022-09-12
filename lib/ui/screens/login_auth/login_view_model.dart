import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/ui/screens/welcome_screen/welcom_screen.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/services/database_service.dart';
import '../../../locator.dart';

class LoginViewModel extends ChangeNotifier {
  final log = Logger();
  final authService = locator<AuthService>();
  final dbService = locator<DatabaseService>();
  String? email;
  requestLogin() async {
    log.d("requestLogin  :: $email");
    try {
      final response = await authService.loginWithEmail(email!);
      if (response.success) {
        authService.userEmail = email!;
        Get.off(() => HomeScreen(email: email!));
        log.d("requestLogin  :: ${authService.logInDataBody.toJson()}");
      } else {
        Fluttertoast.showToast(msg: '${response.error}');
      }
    } catch (e, s) {
      log.d("@LoginViewModel requestLogin Exceptions : $e");
      log.d(s);
    }
  }
}
