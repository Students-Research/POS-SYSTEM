import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/core/body/single_invoices_body.dart';

import '../../../core/constant/colors.dart';

class Product extends StatelessWidget {
  Product({Key? key, required this.singleInvoicesBody}) : super(key: key);

  SingleInvoicesBody singleInvoicesBody;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                width: 414.w,
                height: 210.h,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          'Invoice No  000${singleInvoicesBody.id}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '15/12/2022',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    customRow(
                        'Total Amount', '${singleInvoicesBody.totalAmount}/-'),
                    customRow('Discount', '${singleInvoicesBody.discount}/-'),
                    customRow(
                        'Net Amount', '${singleInvoicesBody.netAmount}/-'),
                    customRow('Paid', '${singleInvoicesBody.paidAmount}/-'),
                  ]),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: kBrownColor.withOpacity(0.6),
                ),
              ),
              Container(
                width: 414.w,
                height: 1.sh / 1.7,
                color: kGreyColor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Products',
                          style: TextStyle(
                            fontFamily: 'popines',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 1.sh / 2.1,
                        child: ListView.builder(
                          itemCount:
                              singleInvoicesBody.soldProduct?.length ?? 0,
                          itemBuilder: (context, index) => productsCard(
                            soldProduct: singleInvoicesBody.soldProduct![index],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productsCard({required SoldProduct soldProduct}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        width: 414.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: kWhiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  soldProduct.products?.productName ?? '',
                  style: TextStyle(
                    fontFamily: 'popines',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('Quantity: ${soldProduct.quantity}'),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${soldProduct.products?.s_price}/-',
                  style: TextStyle(
                    fontFamily: 'popines',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Padding customRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
