import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/core/body/invoices_body.dart';
import 'package:point_of_sale/core/constant/colors.dart';

class CustomInvoiceContainer extends StatelessWidget {
  const CustomInvoiceContainer(
      {Key? key, required this.invoiceBody, required this.onTap})
      : super(key: key);
  final InvoiceBody invoiceBody;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 376.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: kWhiteColor),
          child: Padding(
            padding: EdgeInsets.only(left: 15.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invoice no",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          )),
                      SizedBox(
                        width: 5.h,
                      ),
                      Text(
                        "000${invoiceBody.id}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 14.sp),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "15/12/2022",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: kBrownColor.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text('Amount: ${invoiceBody.totalAmount}'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
