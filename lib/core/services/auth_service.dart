import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/core/body/invoices_body.dart';
import 'package:point_of_sale/core/body/login.dart';
import 'package:point_of_sale/core/body/single_invoices_body.dart';
import 'package:point_of_sale/core/services/database_service.dart';

import '../../locator.dart';
import '../response/auth_response.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
///
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [signupWithApple]:
///
/// [signupWithGmail]:
///
/// [signupWithFacebook]:
///
/// [logout]:
///

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final _facebookLogin = FacebookAuth.instance;
  late bool isLogin;
  final log = Logger();
  // final _localStorageService = locator<LocalStorageService>();
  final _dbService = locator<DatabaseService>();
  LogInDataBody logInDataBody = LogInDataBody();
  InvoicesBody invoicesBody = InvoicesBody();
  SingleInvoicesBody singleInvoicesBody = SingleInvoicesBody();
  String? fcmToken;
  String? userEmail;
  //static final Logger log = CustomLogger(className: 'AuthService');

  ///
  /// [doSetup] Function does the following things:
  ///   1) Checks if the user is logged then:
  ///       a) Get the user profile data
  ///       b) Updates the user FCM Token
  ///
  doSetup() async {}

  _getUserProfile() async {}

  ///
  /// Updating FCM Token here...
  ///

  signupWithEmailAndPassword() async {
    // late AuthResponse response;
    // response = await _dbService.createAccount(body);
    // if (response.success) {
    //   userProfile = GetProfileData.fromJson(body.toJson());
    //   _localStorageService.accessToken = response.accessToken;
    //   //await updateFcmToken();
    // }
    // return response;
  }

//////////////////

  ///////////////////

  loginWithEmail(String email) async {
    final response = await _dbService.loginWithEmail(email);
    //log.d("loginWithEmail :: ${logInDataBody.toJson()}");
    // if (response.success) {
    //   // await _getUserProfile();
    //   // _updateFcmToken();
    // }
    return response;
  }

  getInvoiceData({int? id, String? email}) async {
    final response = await _dbService.getInvoiceData(id: id, email: email);
    //log.d("loginWithEmail :: ${logInDataBody.toJson()}");
    // if (response.success) {
    //   // await _getUserProfile();
    //   // _updateFcmToken();
    // }
    return response;
  }

  getProductDetails({int? id, String? email}) async {
    final response = await _dbService.getProductDetails(id: id, email: email);
    //log.d("loginWithEmail :: ${logInDataBody.toJson()}");
    // if (response.success) {
    //   // await _getUserProfile();
    //   // _updateFcmToken();
    // }
    return response;
  }

  //////////////////

  ///
  /// Google SignIn
  ///
  // Future<AuthResponse> loginWithGoogle() async {
  //   late AuthResponse response;
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     log.d('accessToken => ${googleAuth.accessToken!}');
  //     log.d('idToken => ${googleAuth.idToken!}');

  //     log.d('googleUser ==================> ${googleAuth.accessToken}');

  //     response = await _dbService.loginWithGoogle(googleAuth.accessToken!);
  //     if (response.success) {
  //       if (response.success) {
  //         _localStorageService.accessToken = response.accessToken;

  //         // isNotificationTurnOn = _localStorageService.notificationFlag != null;
  //         await _getUserProfile();
  //         //if (isNotificationTurnOn) await _updateFcmToken();
  //       }
  //     }
  //     return response;
  //   } catch (e) {
  //     log.e('Exception @signUpWithGoogle: $e');
  //   }
  //   return response;
  // }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  logout() async {
    isLogin = false;
    //userProfile = null;
    //await _dbService.clearFcmToken(await DeviceInfoService().getDeviceId());
    //_localStorageService.accessToken = null;
  }
}
