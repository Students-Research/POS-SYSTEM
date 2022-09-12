import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/ui/screens/login_auth/login_view_model.dart';

import '../../custom_widget/background_design.dart';
import '../../custom_widget/custom_elevatd_button.dart';
import '../../custom_widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: Consumer<LoginViewModel>(
          builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const BackgroundDesign(),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset("assets/imac1.png"),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextField(
                            isUpdateData: true,
                            onSaved: (email) {
                              value.email = email;
                            },
                            lable: 'Email',
                            obscureText: false,
                            textInputType: TextInputType.emailAddress,
                            suffixIcon: const Icon(Icons.email_outlined),
                          ),
                          CustomElevatedButton(
                            buttonText: 'Login',
                            onPressed: () async {
                              // Get.to(const RootScreen());
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                value.requestLogin();
                              }
                            },
                            borderRadiusGeometry: BorderRadius.circular(10.0.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
