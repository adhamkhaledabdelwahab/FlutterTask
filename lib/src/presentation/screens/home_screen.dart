import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/gen/fonts.gen.dart';
import 'package:flutter_task/src/core/constants/palette.dart';
import 'package:flutter_task/src/core/router/app_router_names.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/presentation/bloc_manager/manager_bloc.dart';
import 'package:flutter_task/src/presentation/widgets/category_list_item.dart';
import 'package:flutter_task/src/presentation/widgets/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _productViewType = ProductListViewType.vertical;
  String? _selectedCategory;

  @override
  void initState() {
    ManagerBloc.get(context)
      ..add(ManagerEventHolder(event: ManagerEvents.fetchProducts))
      ..add(ManagerEventHolder(event: ManagerEvents.fetchCategories));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المنتجات",
          style: TextStyle(
            fontSize: 20.sp,
            color: Palette.black,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.montserratArabic,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
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
            onPressed: () {
              Navigator.pushNamed(context, AppRouterNames.rAddProduct);
            },
            icon: Icon(
              Icons.add,
              color: Palette.defaultBlack,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 145.h,
            width: double.infinity,
            child: BlocBuilder<ManagerBloc, ManagerState>(
              buildWhen: (context, state) =>
                  state is FetchCategoriesStateHolder,
              builder: (context, state) {
                return switch (state.state) {
                  (BlocState.loading) => _loadingBuilder(),
                  (BlocState.success) => Builder(builder: (context) {
                      final data = state.data as List<CategoryEntity>;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoryListItem(
                          category: index == 0 ? null : data[index - 1],
                          selected: (index == 0 && _selectedCategory == null) ||
                              (index > 0 &&
                                  data[index - 1].id == _selectedCategory),
                          onCategorySelected: () {
                            setState(() {
                              _selectedCategory =
                                  index == 0 ? null : data[index - 1].id;
                            });
                          },
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8.w,
                        ),
                        itemCount: data.length + 1,
                      );
                    }),
                  (BlocState.error) => _errorBuilder(
                      state.error!.message.toString(),
                    ),
                  (_) => Container(),
                };
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h, bottom: 16.h),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.r),
                ),
              ),
              onPressed: () {
                setState(() {
                  _productViewType = switch (_productViewType) {
                    ProductListViewType.vertical =>
                      ProductListViewType.horizontal,
                    ProductListViewType.horizontal =>
                      ProductListViewType.vertical,
                  };
                });
              },
              icon: SvgPicture.asset(
                Assets.icons.icListViewType,
                width: 24.r,
                height: 24.r,
              ),
              label: Text(
                "تغيير عرض المنتجات الى افقي",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.montserratArabic,
                  fontWeight: FontWeight.w400,
                  color: Palette.red,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ManagerBloc, ManagerState>(
              buildWhen: (context, state) => state is FetchProductsStateHolder,
              builder: (context, state) {
                return switch (state.state) {
                  (BlocState.loading) => _loadingBuilder(),
                  (BlocState.success) => Builder(
                      builder: (context) {
                        final data = state.data as List<ProductEntity>;
                        final filterResult = data
                            .where(
                              (element) =>
                                  element.category.id == _selectedCategory ||
                                  _selectedCategory == null,
                            )
                            .toList();
                        return filterResult.isEmpty
                            ? Center(
                                child: Text(
                                  "لا يوجد منتجات",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Palette.defaultBlack,
                                    fontFamily: FontFamily.montserratArabic,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                padding: EdgeInsetsDirectional.only(
                                  start: 16.w,
                                  end: 16.w,
                                  bottom: 45.h +
                                      MediaQuery.viewPaddingOf(context).bottom,
                                ),
                                scrollDirection: switch (_productViewType) {
                                  ProductListViewType.vertical => Axis.vertical,
                                  ProductListViewType.horizontal =>
                                    Axis.horizontal,
                                },
                                itemBuilder: (context, index) =>
                                    ProductListItem(
                                  product: filterResult[index],
                                  viewType: _productViewType,
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 15.h,
                                  width: 15.h,
                                ),
                                itemCount: filterResult.length,
                              );
                      },
                    ),
                  (BlocState.error) => _errorBuilder(
                      state.error!.message.toString(),
                    ),
                  (_) => Container(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingBuilder() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _errorBuilder(String message) => Center(
        child: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: Palette.red,
          ),
        ),
      );
}

enum ProductListViewType { vertical, horizontal }
