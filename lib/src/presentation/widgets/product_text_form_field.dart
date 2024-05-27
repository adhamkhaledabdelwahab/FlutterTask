import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/palette.dart';

class ProductTextFormField extends StatelessWidget {
  const ProductTextFormField({
    super.key,
    required this.title,
    required this.hint,
    required this.textInputAction,
    required this.keyboardType,
    required this.controller,
    this.validationError,
  });

  final TextEditingController controller;
  final String title;
  final String hint;
  final String? validationError;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.montserratArabic,
            color: Palette.defaultBlack,
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            constraints: BoxConstraints(
              minHeight: 60.h,
              maxHeight: 60.h,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: FontFamily.montserratArabic,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              color: Palette.hintColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                width: 1.w,
                color: Palette.textFieldBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                width: 1.w,
                color: Palette.defaultBlue,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                width: 1.w,
                color: Palette.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                width: 1.w,
                color: Palette.textFieldBorderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                width: 1.w,
                color: Palette.red,
              ),
            ),
          ),
        ),
        if (validationError != null) ...[
          SizedBox(
            height: 6.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w),
            child: Text(
              validationError!,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.montserratArabic,
                color: Palette.red,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
