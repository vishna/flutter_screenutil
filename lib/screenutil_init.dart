part of flutter_screenutil;

class ScreenUtilInit extends StatelessWidget {
  /// A helper widget that initializes [ScreenUtil]
  ScreenUtilInit({
    required this.builder,
    this.designSize = ScreenUtil.defaultSize,
    this.splitScreenMode = false,
    this.minTextAdapt = false,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;
  final bool splitScreenMode;
  final bool minTextAdapt;
  final bool disabled;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      if (constraints.maxWidth != 0) {
        final Orientation orientation =
            constraints.maxWidth > constraints.maxHeight
                ? Orientation.landscape
                : Orientation.portrait;
        ScreenUtil.init(constraints,
            context: _,
            orientation: orientation,
            designSize: designSize,
            splitScreenMode: splitScreenMode,
            minTextAdapt: minTextAdapt,
            disabled: disabled);
        return builder();
      }
      return Container();
    });
  }
}
