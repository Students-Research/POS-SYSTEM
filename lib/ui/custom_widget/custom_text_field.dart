// ignore: depend_on_referenced_packages
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.svgAsset,
      this.textInputType,
      required this.obscureText,
      this.hintText,
      this.lable,
      this.suffixIcon,
      this.prefixIcon,
      this.inputBorder,
      this.onSaved,
      this.validation,
      this.controller,
      this.visibilityFunction,
      this.textInputAction,
      this.filledColor,
      this.onChanged,
      this.onTap,
      this.isUpdateData,
      this.focusNode})
      : super(key: key);

  // variables
  final String? hintText;
  final String? lable;
  final void Function()? onTap;
  final bool? obscureText;
  final TextInputType? textInputType;
  final InputBorder? inputBorder;
  final String? svgAsset;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final String? Function(String?)? validation;
  final dynamic controller;
  final TextInputAction? textInputAction;
  final onSaved;
  final onChanged;
  final Color? filledColor;
  final FocusNode? focusNode;
  final bool? isUpdateData;

  final Function(String)? visibilityFunction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: widget.isUpdateData == true ? 17.h : 19.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: widget.isUpdateData == true ? 53.h : 63.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            validator: widget.validation,
            onTap: widget.onTap,
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,

            textInputAction: widget.textInputAction,

            keyboardType: widget.textInputType ?? TextInputType.text,
            obscureText: widget.obscureText! ? visibility : false,

            //This is the text field style and decoration
            decoration: InputDecoration(
              labelText: widget.lable,
              labelStyle: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
              suffixIcon: widget.obscureText == true
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      child: visibility
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility_off,
                            ),
                    )
                  : widget.suffixIcon,
              contentPadding: EdgeInsets.only(
                  top: widget.isUpdateData == true ? 16.h : 22.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: widget.isUpdateData == true ? 16.h : 22.h),
              prefixIcon: widget.prefixIcon,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue, width: 1.w),
              ),
              filled: true,
              fillColor: widget.filledColor ?? const Color(0xffF0F4F7),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontSize: 14.sp, fontFamily: 'Poppins', color: Colors.grey),
              border: widget.inputBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
