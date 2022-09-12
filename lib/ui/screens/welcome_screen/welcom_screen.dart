import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/core/constant/colors.dart';
import 'package:point_of_sale/ui/custom_widget/custom_container.dart';
import 'package:point_of_sale/ui/screens/welcome_screen/welcome_screen_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeScreenViewModel(email),
      child: Consumer<WelcomeScreenViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 26.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(Icons.logout), onPressed: () {})),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h, left: 31.0.w),
                      child: Text(
                        model.authService.logInDataBody.body?[2].customers
                                ?.first.name ??
                            'Jhon Doe',
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      width: 414.w,
                      height: 600.h,
                      color: kGreyColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, left: 20.0.w),
                            child: Text(
                              'Select Shop',
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12.h),
                                  filled: true,
                                  fillColor: kLightColor,
                                  //fillColor: homePrimaryColor,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  prefixIcon: const Icon(Icons.search)),
                            ),
                          ),
                          FutureBuilder(
                            future: model.getWelcomeData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                model.list = ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model.authService.logInDataBody
                                          .body?.length ??
                                      0,
                                  itemBuilder: (context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 15.0.h),
                                      child: CustomContainer(
                                        body: model.authService.logInDataBody
                                            .body![index],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                model.list = Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: CircularProgressIndicator(),
                                ));
                              }
                              return model.list;
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
