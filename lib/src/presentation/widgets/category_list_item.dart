import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/palette.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.selected,
    required this.category,
    required this.onCategorySelected,
  });

  final bool selected;
  final CategoryEntity? category;
  final Function() onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCategorySelected,
      child: Container(
        width: 96.w,
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: !selected
                ? null
                : Border.all(
                    width: 1.w,
                    color: Palette.green,
                  )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: category != null
                    ? Image.asset(
                        category!.image,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Palette.green,
                        alignment: AlignmentDirectional.center,
                        child: SvgPicture.asset(
                          Assets.icons.icViewAll,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              category?.name ?? "عرض الكل",
              style: TextStyle(
                fontFamily: FontFamily.montserratArabic,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Palette.defaultBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
