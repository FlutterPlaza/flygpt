import 'package:flutter/material.dart';

class Constants {
  static _Colors colors(BuildContext context) => _Colors(context);

  static _Texts texts(BuildContext context) => _Texts(context);

  static _Sizes sizes(BuildContext context) => _Sizes(context);

  static _BorderRadius borderRadius(BuildContext context) =>
      _BorderRadius(context);

  static _Insets get gap => _Insets();

  const Constants._();
}

class _BorderRadius {
  _BorderRadius(this.context) {
    b = Constants.sizes(context).of.borderRadius;
  }

  final BuildContext context;
  late final double b;

  BorderRadius get none => BorderRadius.zero;

  BorderRadius get all => BorderRadius.circular(b);

  BorderRadius get circular => BorderRadius.circular(b);

  BorderRadius get top => BorderRadius.only(
        topLeft: Radius.circular(b),
        topRight: Radius.circular(b),
      );

  BorderRadius get bottom => BorderRadius.only(
        bottomLeft: Radius.circular(b),
        bottomRight: Radius.circular(b),
      );

  BorderRadius get left => BorderRadius.only(
        topLeft: Radius.circular(b),
        bottomLeft: Radius.circular(b),
      );

  BorderRadius get right => BorderRadius.only(
        topRight: Radius.circular(b),
        bottomRight: Radius.circular(b),
      );

  BorderRadius get topLeft => BorderRadius.only(
        topLeft: Radius.circular(b),
      );

  BorderRadius get topRight => BorderRadius.only(
        topRight: Radius.circular(b),
      );

  BorderRadius get bottomLeft => BorderRadius.only(
        bottomLeft: Radius.circular(b),
      );

  BorderRadius get bottomRight => BorderRadius.only(
        bottomRight: Radius.circular(b),
      );
}

class _Insets {
  EdgeInsets get none => EdgeInsets.zero;

  EdgeInsets all(double size) => EdgeInsets.all(size);

  EdgeInsets symmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  EdgeInsets only({
    double top = 0.0,
    double bottom = 0.0,
    double left = 0.0,
    double right = 0.0,
  }) =>
      EdgeInsets.only(top: top, bottom: bottom, left: left, right: right);

  EdgeInsets fromLTRB(double left, double top, double right, double bottom) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);
}

class _Sizes {
  const _Sizes(this.context);

  final BuildContext context;

  _AllSizes get of {
    final screenWidth = MediaQuery.sizeOf(context).width;
    // Adjust screen width based on orientation if necessary
    // For this example, we'll use the width as is, since it already accounts for orientation

    if (screenWidth < 576) {
      // Extra Small (XSmall)
      return const _XSmallSizes();
    } else if (screenWidth >= 576 && screenWidth <= 767) {
      // Small (S)
      return const _SmallSizes();
    } else if (screenWidth >= 768 && screenWidth <= 1024) {
      // Medium (M)
      return const _MediumSizes();
    } else if (screenWidth >= 1025 && screenWidth <= 1440) {
      // Large (L)
      return const _LargeSizes();
    } else if (screenWidth >= 1441 && screenWidth <= 1920) {
      // Extra Large (XL)
      return const _XLargeSizes();
    } else if (screenWidth > 1920) {
      // Extra-Extra Large (XXL)
      return const _XXLargeSizes();
    } else {
      // Default to Medium if none match
      return const _MediumSizes();
    }
  }
}

class _XSmallSizes extends _BaseSizes {
  const _XSmallSizes() : super(adjustment: 0.0);
}

class _SmallSizes extends _BaseSizes {
  const _SmallSizes() : super(adjustment: 4.0);
}

class _MediumSizes extends _BaseSizes {
  const _MediumSizes() : super(adjustment: 8.0);
}

class _LargeSizes extends _BaseSizes {
  const _LargeSizes() : super(adjustment: 12.0);
}

class _XLargeSizes extends _BaseSizes {
  const _XLargeSizes() : super(adjustment: 16.0);
}

class _XXLargeSizes extends _BaseSizes {
  const _XXLargeSizes() : super(adjustment: 20.0);
}

class _BaseSizes implements _AllSizes {
  final double adjustment;

  const _BaseSizes({required this.adjustment});

  // Base default values
  static const double _hpaddingBase = 8.0;
  static const double _hmarginBase = 8.0;
  static const double _vpaddingBase = 8.0;
  static const double _vmarginBase = 8.0;
  static const double _borderRadiusBase = 8.0;
  static const double _iconSizeBase = 16.0;
  static const double _xSmallBase = 8.0;
  static const double _smallBase = 12.0;
  static const double _baseBase = 16.0;
  static const double _largeBase = 20.0;
  static const double _xLargeBase = 24.0;
  static const double _xxLargeBase = 28.0;
  static const double _xxxLargeBase = 32.0;
  static const double _xxxxLargeBase = 36.0;

  @override
  double get hpadding => _hpaddingBase + adjustment;

  @override
  double get hmargin => _hmarginBase + adjustment;

  @override
  double get vpadding => _vpaddingBase + adjustment / 2;

  @override
  double get vmargin => _vmarginBase + adjustment / 2;

  @override
  double get borderRadius => _borderRadiusBase + adjustment;

  @override
  double get iconSize => _iconSizeBase + adjustment;

  @override
  double get xSmall => _xSmallBase + adjustment;

  @override
  double get small => _smallBase + adjustment;

  @override
  double get base => _baseBase + adjustment;

  @override
  double get large => _largeBase + adjustment;

  @override
  double get xLarge => _xLargeBase + adjustment;

  @override
  double get xxLarge => _xxLargeBase + adjustment;

  @override
  double get xxxLarge => _xxxLargeBase + adjustment;

  @override
  double get xxxxLarge => _xxxxLargeBase + adjustment;
}

abstract class _AllSizes {
  double get vpadding;

  double get hpadding;

  double get hmargin;

  double get vmargin;

  double get borderRadius;

  double get iconSize;

  double get xSmall;

  double get small;

  double get base;

  double get large;

  double get xLarge;

  double get xxLarge;

  double get xxxLarge;

  double get xxxxLarge;
}

class _Texts {
  const _Texts(this.context);

  final BuildContext context;

  _AllTexts get of {
    final textTheme = Theme.of(context).textTheme;
    return Theme.of(context).brightness == Brightness.dark
        ? _DarkText(textTheme)
        : _LightText(textTheme);
  }
}

abstract class _AllTexts {
  TextStyle get displayLarge;

  TextStyle get displayMedium;

  TextStyle get displaySmall;

  TextStyle get headlineLarge;

  TextStyle get headlineMedium;

  TextStyle get headlineSmall;

  TextStyle get titleLarge;

  TextStyle get titleMedium;

  TextStyle get titleSmall;

  TextStyle get bodyLarge;

  TextStyle get bodyMedium;

  TextStyle get bodySmall;

  TextStyle get labelLarge;

  TextStyle get labelMedium;

  TextStyle get labelSmall;
}

class _DarkText implements _AllTexts {
  const _DarkText(this.textTheme);

  final TextTheme textTheme;

  @override
  TextStyle get displayLarge =>
      textTheme.displayLarge!.copyWith(color: Colors.white);

  @override
  TextStyle get displayMedium =>
      textTheme.displayMedium!.copyWith(color: Colors.white);

  @override
  TextStyle get displaySmall =>
      textTheme.displaySmall!.copyWith(color: Colors.white);

  @override
  TextStyle get headlineLarge =>
      textTheme.headlineLarge!.copyWith(color: Colors.white);

  @override
  TextStyle get headlineMedium =>
      textTheme.headlineMedium!.copyWith(color: Colors.white);

  @override
  TextStyle get headlineSmall =>
      textTheme.headlineSmall!.copyWith(color: Colors.white);

  @override
  TextStyle get titleLarge =>
      textTheme.titleLarge!.copyWith(color: Colors.white);

  @override
  TextStyle get titleMedium =>
      textTheme.titleMedium!.copyWith(color: Colors.white);

  @override
  TextStyle get titleSmall =>
      textTheme.titleSmall!.copyWith(color: Colors.white);

  @override
  TextStyle get bodyLarge => textTheme.bodyLarge!.copyWith(color: Colors.white);

  @override
  TextStyle get bodyMedium =>
      textTheme.bodyMedium!.copyWith(color: Colors.white);

  @override
  TextStyle get bodySmall => textTheme.bodySmall!.copyWith(color: Colors.white);

  @override
  TextStyle get labelLarge =>
      textTheme.labelLarge!.copyWith(color: Colors.white);

  @override
  TextStyle get labelMedium =>
      textTheme.labelMedium!.copyWith(color: Colors.white);

  @override
  TextStyle get labelSmall =>
      textTheme.labelSmall!.copyWith(color: Colors.white);
}

class _LightText implements _AllTexts {
  const _LightText(this.textTheme);

  final TextTheme textTheme;

  @override
  TextStyle get displayLarge =>
      textTheme.displayLarge!.copyWith(color: Colors.black);

  @override
  TextStyle get displayMedium =>
      textTheme.displayMedium!.copyWith(color: Colors.black);

  @override
  TextStyle get displaySmall =>
      textTheme.displaySmall!.copyWith(color: Colors.black);

  @override
  TextStyle get headlineLarge =>
      textTheme.headlineLarge!.copyWith(color: Colors.black);

  @override
  TextStyle get headlineMedium =>
      textTheme.headlineMedium!.copyWith(color: Colors.black);

  @override
  TextStyle get headlineSmall =>
      textTheme.headlineSmall!.copyWith(color: Colors.black);

  @override
  TextStyle get titleLarge => textTheme.titleLarge!
      .copyWith(color: Colors.black, fontWeight: FontWeight.w800);

  @override
  TextStyle get titleMedium =>
      textTheme.titleMedium!.copyWith(color: Colors.black);

  @override
  TextStyle get titleSmall =>
      textTheme.titleSmall!.copyWith(color: Colors.black38);

  @override
  TextStyle get bodyLarge => textTheme.bodyLarge!.copyWith(color: Colors.black);

  @override
  TextStyle get bodyMedium =>
      textTheme.bodyMedium!.copyWith(color: Colors.black);

  @override
  TextStyle get bodySmall => textTheme.bodySmall!.copyWith(color: Colors.black);

  @override
  TextStyle get labelLarge =>
      textTheme.labelLarge!.copyWith(color: Colors.black);

  @override
  TextStyle get labelMedium =>
      textTheme.labelMedium!.copyWith(color: Colors.black);

  @override
  TextStyle get labelSmall =>
      textTheme.labelSmall!.copyWith(color: Colors.black);
}

class _Colors {
  const _Colors(this.context);

  final BuildContext context;

  _AllColors get of {
    return Theme.of(context).brightness == Brightness.dark
        ? const _Black()
        : const _White();
  }
}

class _White implements _AllColors {
  const _White();

  @override
  Color get backgroundColor => Colors.white;

  @override
  // TODO: implement color : default color to red
  Color get iconColor => Colors.red;

  @override
  // TODO: implement color : default color to red
  Color get textColor => Colors.red;

  @override
  Color get cardColor => const Color(0xFF000000).withOpacity(0.05);

  @override
  Color get dividerColor => const Color(0xff000000).withOpacity(0.1);

  @override
  Color get accentColor => Colors.blue;
}

class _Black implements _AllColors {
  const _Black();

  @override
  Color get backgroundColor => const Color(0xff2A2A2A);

  @override
  // TODO: implement color : default color to red
  Color get cardColor => Colors.red;

  @override
  // TODO: implement color : default color to red
  Color get iconColor =>  Colors.red;

  @override
  // TODO: implement color : default color to red
  Color get textColor => Colors.red;

  @override
  Color get dividerColor => const Color(0xffffffff).withOpacity(0.05);

  @override
  Color get accentColor => Colors.blue;
}

abstract class _AllColors {
  Color get cardColor;

  Color get backgroundColor;

  Color get textColor;

  Color get iconColor;

  Color get dividerColor;

  Color get accentColor;
}
