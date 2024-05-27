import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/palette.dart';

class ProductDropDownFormField<T> extends StatelessWidget {
  const ProductDropDownFormField({
    super.key,
    required this.title,
    required this.hint,
    required this.selectedValue,
    required this.data,
    required this.onChange,
    this.validationError,
  });

  final String title;
  final String hint;
  final String? validationError;
  final T? selectedValue;
  final List<DropdownMenuItem<T>> data;
  final Function(T?) onChange;

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
        DropdownButtonFormField<T>(
          value: selectedValue,
          icon: SvgPicture.asset(
            Assets.icons.icArrowDown,
            height: 24.r,
            width: 24.r,
          ),
          hint: Text(
            hint,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.montserratArabic,
                color: Palette.blue),
          ),
          items: data,
          onChanged: onChange,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            constraints: BoxConstraints(
              minHeight: 60.h,
              maxHeight: 60.h,
            ),
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
