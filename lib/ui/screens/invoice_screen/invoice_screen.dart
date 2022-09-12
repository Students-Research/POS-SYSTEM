import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/core/body/login.dart';
import 'package:point_of_sale/ui/screens/invoice_screen/invoice_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/colors.dart';
import '../../custom_widget/custom_invoice_container.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key, required this.body}) : super(key: key);
  final LogInBody body;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InvoiceScreenViewModel(),
      child: Consumer<InvoiceScreenViewModel>(
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
          backgroundColor: kGreyColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 26.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h, left: 15.w),
                    child: Text(
                      'Invoice',
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
                          hintText: 'invoice no',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                  FutureBuilder(
                    future: model.getInvoiceData(body),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        model.list = ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                model.authService.invoicesBody.body?.length ??
                                    0,
                            itemBuilder: (BuildContext contex, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 12.0.h),
                                child: CustomInvoiceContainer(
                                  onTap: () {
                                    model.getProductDetails(
                                      id: model.authService.invoicesBody
                                          .body![index].id!,
                                    );
                                  },
                                  invoiceBody: model
                                      .authService.invoicesBody.body![index],
                                ),
                              );
                            });
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
            ),
          ),
        )),
      ),
    );
  }
}
