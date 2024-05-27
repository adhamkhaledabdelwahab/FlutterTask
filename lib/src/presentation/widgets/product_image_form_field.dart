import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/palette.dart';
import 'package:image_picker/image_picker.dart';

class ProductImageFormField extends StatelessWidget {
  const ProductImageFormField({
    super.key,
    required this.images,
    required this.onRemoteImage,
    required this.onAddImage,
    this.validationError,
  });

  final String? validationError;
  final List<XFile> images;
  final Function(int) onRemoteImage;
  final Function() onAddImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "صور المنتج",
          style: TextStyle(
            fontFamily: FontFamily.montserratArabic,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Palette.defaultBlack,
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        SizedBox(
          height: 99.75.h,
          width: double.infinity,
          child: switch (images.isEmpty) {
            (true) => Center(
                child: Text(
                  "لا يوجد صور للمنتج !",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.montserratArabic,
                    color: Palette.defaultBlack,
                  ),
                ),
              ),
            (false) => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 96.76.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(images[index].path)),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  alignment: AlignmentDirectional.topEnd,
                  child: GestureDetector(
                    onTap: () => onRemoteImage(index),
                    child: Container(
                      height: 19.95.r,
                      width: 19.95.r,
                      margin: EdgeInsetsDirectional.only(
                        end: 7.98.w,
                        top: 8.98.h,
                      ),
                      decoration: BoxDecoration(
                        color: Palette.defaultRed.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: const FittedBox(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 1.99.w,
                ),
                itemCount: images.length,
              ),
          },
        ),
        SizedBox(
          height: 14.25.h,
        ),
        TextButton.icon(
          style: TextButton.styleFrom(
            fixedSize: Size(double.infinity, 60.h),
            backgroundColor: Palette.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          onPressed: onAddImage,
          icon: SvgPicture.asset(
            Assets.icons.icAddCircularSquare,
          ),
          label: Text(
            "اضغط لاضافة الصور",
            style: TextStyle(
              fontFamily: FontFamily.montserratArabic,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              color: Colors.white,
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
