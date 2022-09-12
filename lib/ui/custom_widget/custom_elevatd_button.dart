import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialElevatedButton extends StatelessWidget {
  const CustomSocialElevatedButton(
      {Key? key, required this.svgIcon, this.onPressed})
      : super(key: key);

  final Widget svgIcon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(const Color(0xffF1F5F8))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: svgIcon,
      ),
    );
  }
}

//
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.borderRadiusGeometry})
      : super(key: key);

  // variables
  final VoidCallback onPressed;
  final String buttonText;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadiusGeometry ?? BorderRadius.circular(30.0.r),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color(0xff3A42FA).withOpacity(0.7)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 14.0.h,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontFamily: "Popins",
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Back Arrow IconButton
class BackArrowIconButton extends StatelessWidget {
  const BackArrowIconButton({
    Key? key,
    this.icon,
  }) : super(key: key);
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 30.r,
      onPressed: () => Navigator.pop(context),
      icon: icon ??
          Icon(
            Icons.arrow_back_ios,
            size: 35.h,
            color: const Color(
              0xff01579B,
            ),
          ),
    );
  }
}
