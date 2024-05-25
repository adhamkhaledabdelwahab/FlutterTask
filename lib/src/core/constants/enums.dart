enum ImageType {
  assets(1),
  external(2);

  const ImageType(this.val);

  final int val;

  static ImageType fromVal(int val) => switch (val) {
        (1) => assets,
        (2) || (_) => external,
      };
}
