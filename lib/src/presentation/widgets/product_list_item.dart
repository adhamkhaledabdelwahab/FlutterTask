import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/constants/palette.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/presentation/screens/home_screen.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
    required this.viewType,
  });

  final ProductEntity product;
  final ProductListViewType viewType;

  Widget _buildVerticalView() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productImage(
            width: 114.w,
            height: double.infinity,
          ),
          SizedBox(
            width: 14.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productName(),
              SizedBox(
                height: 8.h,
              ),
              _productPrice(),
              SizedBox(
                height: 14.h,
              ),
              _productStore(),
            ],
          )
        ],
      );

  Widget _buildHorizontalView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _productImage(),
          ),
          SizedBox(
            height: 14.w,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _productName(),
                SizedBox(
                  height: 8.h,
                ),
                _productPrice(),
                SizedBox(
                  height: 14.h,
                ),
                _productStore(),
              ],
            ),
          )
        ],
      );

  Widget _productImage({double? width, double? height}) => Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: switch (product.imageType) {
          (ImageType.assets) => Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          (ImageType.external) => Image.file(
              File(product.image),
              fit: BoxFit.cover,
            ),
        },
      );

  Widget _productName() => Text(
        product.name,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.montserratArabic,
          color: Palette.defaultBlack,
        ),
      );

  Widget _productPrice() => Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: product.price.toString(),
              style: TextStyle(
                fontFamily: FontFamily.montserratArabic,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: Palette.green,
              ),
            ),
            TextSpan(
              text: "  دولار",
              style: TextStyle(
                fontFamily: FontFamily.montserratArabic,
                fontWeight: FontWeight.w300,
                fontSize: 12.sp,
                color: Palette.black,
              ),
            ),
          ],
        ),
      );

  Widget _productStore() => Text(
        product.store,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.montserratArabic,
          color: Palette.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: switch (viewType) {
        ProductListViewType.vertical => 115.h,
        ProductListViewType.horizontal => double.infinity,
      },
      width: switch (viewType) {
        ProductListViewType.horizontal =>
          MediaQuery.sizeOf(context).width * 0.75,
        ProductListViewType.vertical => double.infinity,
      },
      child: switch (viewType) {
        (ProductListViewType.vertical) => _buildVerticalView(),
        (ProductListViewType.horizontal) => _buildHorizontalView(),
      },
    );
  }
}
