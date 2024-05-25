import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/palette.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(
            fixedSize: Size(50.r, 50.r),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Palette.borderColor,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Palette.defaultBlack,
          ),
        ),
        title: Text(
          "اضافة منتجات",
          style: TextStyle(
            fontSize: 20.sp,
            color: Palette.black,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.montserratArabic,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
