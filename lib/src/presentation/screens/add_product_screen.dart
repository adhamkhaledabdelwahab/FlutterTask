import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/constants/palette.dart';
import 'package:flutter_task/src/core/hive_service/hive_service.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/use_case/add_product_use_case.dart';
import 'package:flutter_task/src/presentation/manager/add_product_bloc/add_product_bloc.dart';
import 'package:flutter_task/src/presentation/manager/fetch_categories_bloc/fetch_categories_bloc.dart';
import 'package:flutter_task/src/presentation/manager/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:flutter_task/src/presentation/widgets/product_dropdown_form_field.dart';
import 'package:flutter_task/src/presentation/widgets/product_image_form_field.dart';
import 'package:flutter_task/src/presentation/widgets/product_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _images = <XFile>[];
  final _picker = ImagePicker();
  late TextEditingController _productNameController;
  late TextEditingController _storeNameController;
  late TextEditingController _priceController;
  CategoryEntity? _selectedCategory;
  String? _productNameValidationError;
  String? _storeNameValidationError;
  String? _priceValidationError;
  String? _selectedCategoryValidationError;
  String? _imagesValidationError;

  @override
  void initState() {
    _productNameController = TextEditingController();
    _storeNameController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _storeNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future _pickMultiImages() async {
    final image = await _picker.pickMultiImage();
    if (image.isNotEmpty) {
      setState(() {
        _images.addAll(image);
      });
    }
  }

  bool _validate() {
    _productNameValidationError = null;
    _storeNameValidationError = null;
    _priceValidationError = null;
    _selectedCategoryValidationError = null;
    _imagesValidationError = null;
    final productName = _productNameController.text.trim();
    if (productName.isEmpty) {
      _productNameValidationError = "اسم المنتج مطلوب!";
    }
    final storeName = _storeNameController.text.trim();
    if (storeName.isEmpty) {
      _storeNameValidationError = "اسم المتجر مطلوب!";
    }
    final price = num.tryParse(_priceController.text.trim());
    if (price == null) {
      _priceValidationError = "سعر المنتج مطلوب!";
    }
    final selectedCategory = _selectedCategory;
    if (selectedCategory == null) {
      _selectedCategoryValidationError = "تصنيف المنتج مطلوب!";
    }
    final images = _images;
    if (images.isEmpty) {
      _imagesValidationError = "على الاقل صوره واحده للمنتج مطلوبه!";
    }
    setState(() {});
    return productName.isNotEmpty &&
        price != null &&
        storeName.isNotEmpty &&
        images.isNotEmpty &&
        selectedCategory != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductBloc(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductImageFormField(
                images: _images,
                onAddImage: _pickMultiImages,
                validationError: _imagesValidationError,
                onRemoteImage: (index) {
                  setState(() {
                    _images.removeAt(index);
                  });
                },
              ),
              SizedBox(
                height: 26.h,
              ),
              ProductTextFormField(
                controller: _productNameController,
                title: "اسم المنتج",
                hint: "اسم المنتج",
                validationError: _productNameValidationError,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProductTextFormField(
                controller: _storeNameController,
                title: "اسم المتجر",
                hint: "اسم المتجر",
                validationError: _storeNameValidationError,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProductTextFormField(
                controller: _priceController,
                title: "السعر",
                hint: "السعر",
                validationError: _priceValidationError,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 21.h,
              ),
              BlocBuilder<FetchCategoriesBloc, FetchCategoriesState>(
                builder: (context, state) {
                  return ProductDropDownFormField<CategoryEntity>(
                    title: "اسم التصنيف",
                    hint: "اسم التصنيف",
                    validationError: _selectedCategoryValidationError,
                    selectedValue: _selectedCategory,
                    data: state.data!
                        .map(
                          (e) => DropdownMenuItem<CategoryEntity>(
                            value: e,
                            child: Text(
                              e.name,
                              style: TextStyle(
                                fontFamily: FontFamily.montserratArabic,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Palette.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChange: (val) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    },
                  );
                },
              ),
              SizedBox(
                height: 32.h,
              ),
              BlocConsumer<AddProductBloc, AddProductState>(
                listener: (context, state) {
                  if (state.state == BlocState.success) {
                    FetchProductsBloc.get(context)
                        .state
                        .data
                        ?.add(state.product!);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return state.state == BlocState.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size(double.infinity, 60.h),
                            backgroundColor: Palette.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          onPressed: () {
                            if (_validate() == true) {
                              final params = ProductParams(
                                id: HiveService.uuid.v1(),
                                name: _productNameController.text,
                                price: num.parse(_priceController.text),
                                category: _selectedCategory!,
                                store: _storeNameController.text,
                                images: _images.map((e) => e.path).toList(),
                              );
                              AddProductBloc.get(context)
                                  .add(AddProduct(params: params));
                            }
                          },
                          child: Text(
                            "اضافه المنتج",
                            style: TextStyle(
                              fontFamily: FontFamily.montserratArabic,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        );
                },
              ),
              SizedBox(
                height: 37.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
