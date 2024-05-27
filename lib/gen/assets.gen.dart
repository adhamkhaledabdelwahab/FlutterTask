/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Montserrat-Arabic-Black-900.otf
  String get montserratArabicBlack900 =>
      'assets/fonts/Montserrat-Arabic-Black-900.otf';

  /// File path: assets/fonts/Montserrat-Arabic-Bold-700.otf
  String get montserratArabicBold700 =>
      'assets/fonts/Montserrat-Arabic-Bold-700.otf';

  /// File path: assets/fonts/Montserrat-Arabic-ExtraBold-800.otf
  String get montserratArabicExtraBold800 =>
      'assets/fonts/Montserrat-Arabic-ExtraBold-800.otf';

  /// File path: assets/fonts/Montserrat-Arabic-ExtraLight-275.otf
  String get montserratArabicExtraLight275 =>
      'assets/fonts/Montserrat-Arabic-ExtraLight-275.otf';

  /// File path: assets/fonts/Montserrat-Arabic-Light-300.otf
  String get montserratArabicLight300 =>
      'assets/fonts/Montserrat-Arabic-Light-300.otf';

  /// File path: assets/fonts/Montserrat-Arabic-Medium-500.otf
  String get montserratArabicMedium500 =>
      'assets/fonts/Montserrat-Arabic-Medium-500.otf';

  /// File path: assets/fonts/Montserrat-Arabic-Regular-400.otf
  String get montserratArabicRegular400 =>
      'assets/fonts/Montserrat-Arabic-Regular-400.otf';

  /// File path: assets/fonts/Montserrat-Arabic-SemiBold-600.otf
  String get montserratArabicSemiBold600 =>
      'assets/fonts/Montserrat-Arabic-SemiBold-600.otf';

  /// File path: assets/fonts/Montserrat-Arabic-Thin-250.otf
  String get montserratArabicThin250 =>
      'assets/fonts/Montserrat-Arabic-Thin-250.otf';

  /// List of all assets
  List<String> get values => [
        montserratArabicBlack900,
        montserratArabicBold700,
        montserratArabicExtraBold800,
        montserratArabicExtraLight275,
        montserratArabicLight300,
        montserratArabicMedium500,
        montserratArabicRegular400,
        montserratArabicSemiBold600,
        montserratArabicThin250
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_add_circular_square.svg
  String get icAddCircularSquare => 'assets/icons/ic_add_circular_square.svg';

  /// File path: assets/icons/ic_arrow_down.svg
  String get icArrowDown => 'assets/icons/ic_arrow_down.svg';

  /// File path: assets/icons/ic_list_view_type.svg
  String get icListViewType => 'assets/icons/ic_list_view_type.svg';

  /// File path: assets/icons/ic_view_all.svg
  String get icViewAll => 'assets/icons/ic_view_all.svg';

  /// List of all assets
  List<String> get values =>
      [icAddCircularSquare, icArrowDown, icListViewType, icViewAll];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_category_1.png
  AssetGenImage get imgCategory1 =>
      const AssetGenImage('assets/images/img_category_1.png');

  /// File path: assets/images/img_category_2.png
  AssetGenImage get imgCategory2 =>
      const AssetGenImage('assets/images/img_category_2.png');

  /// File path: assets/images/img_category_3.png
  AssetGenImage get imgCategory3 =>
      const AssetGenImage('assets/images/img_category_3.png');

  /// File path: assets/images/img_product_1.png
  AssetGenImage get imgProduct1 =>
      const AssetGenImage('assets/images/img_product_1.png');

  /// File path: assets/images/img_product_2.png
  AssetGenImage get imgProduct2 =>
      const AssetGenImage('assets/images/img_product_2.png');

  /// File path: assets/images/img_product_3.png
  AssetGenImage get imgProduct3 =>
      const AssetGenImage('assets/images/img_product_3.png');

  /// File path: assets/images/img_product_4.png
  AssetGenImage get imgProduct4 =>
      const AssetGenImage('assets/images/img_product_4.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        imgCategory1,
        imgCategory2,
        imgCategory3,
        imgProduct1,
        imgProduct2,
        imgProduct3,
        imgProduct4
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
