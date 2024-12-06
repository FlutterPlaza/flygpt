import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

AdaptiveDisplay? _display;

// ignore: non_constant_identifier_names
AdaptiveDisplay get Display => _display ??= const AdaptiveDisplay();

void setDisplayOptions(DisplayOptions options) {
  _display = AdaptiveDisplay(
    options: options,
  );
}

class ConstSize {
  static const double radius = 12;
  static const double cardRadius = 20;
  static const double iconSize = 27;
  static final BorderRadius borderRadius = BorderRadius.circular(radius);
  static final BorderRadius cardBorderRadius =
      BorderRadius.circular(cardRadius);

  static const double buttonHeight = 50;
}

enum DisplaySize {
  smallest,
  small,
  medium,
  large,
  xLarge;
}

class ResolutionDouble {
  final double smallest;
  final double small;
  final double medium;
  final double large;
  final double xlarge;

  const ResolutionDouble({
    this.smallest = double.infinity,
    this.small = double.infinity,
    this.medium = double.infinity,
    this.large = double.infinity,
    this.xlarge = double.infinity,
  });
}

class ResolutionEdgeInset {
  final EdgeInsets smallest;
  final EdgeInsets small;
  final EdgeInsets medium;
  final EdgeInsets large;
  final EdgeInsets xlarge;

  const ResolutionEdgeInset({
    this.smallest = EdgeInsets.zero,
    this.small = EdgeInsets.zero,
    this.medium = EdgeInsets.zero,
    this.large = EdgeInsets.zero,
    this.xlarge = EdgeInsets.zero,
  });
}

class DisplayOptions {
  const DisplayOptions({
    this.breakpoints = const ResolutionDouble(
      smallest: 768.0,
      small: 1024.0,
      medium: 1366.0,
      large: 1920.0,
      xlarge: 2500.0,
    ),
    this.pageMargins = const ResolutionDouble(
      smallest: 0.0,
      small: 32.0,
      medium: 60.0,
      large: 80.0,
      xlarge: 240.0,
    ),
    this.gutters = const ResolutionDouble(
      smallest: 0.0,
      small: 16.0,
      medium: 24.0,
      large: 128.0,
      xlarge: 128.0,
    ),
    this.banners = const ResolutionDouble(
      smallest: 40.0,
      small: 40.0,
      medium: 40.0,
      large: 80.0,
      xlarge: 80.0,
    ),
    this.cardMaxWidth = const ResolutionDouble(
      smallest: 0.0,
      small: 448.0,
      medium: 600.0,
      large: 792.0,
      xlarge: 792.0,
    ),
    this.cardMargins = const ResolutionEdgeInset(
      smallest: EdgeInsets.zero,
      small: EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      medium: EdgeInsets.symmetric(
        horizontal: 32.0,
      ),
      large: EdgeInsets.symmetric(
        horizontal: 96.0,
      ),
      xlarge: EdgeInsets.symmetric(
        horizontal: 120.0,
      ),
    ),
    this.cardPadding = const ResolutionEdgeInset(
      smallest: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 16.0,
      ),
      small: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 24.0,
      ),
      medium: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 40.0,
      ),
      large: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 128.0,
      ),
      xlarge: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 128.0,
      ),
    ),
    this.cardTitleMargins = const ResolutionEdgeInset(
      smallest: EdgeInsets.fromLTRB(24, 40, 24, 0),
      small: EdgeInsets.fromLTRB(24, 40, 24, 0),
      medium: EdgeInsets.fromLTRB(24, 40, 24, 0),
      large: EdgeInsets.fromLTRB(24, 40, 24, 0),
      xlarge: EdgeInsets.fromLTRB(24, 40, 24, 0),
    ),
  });

  final ResolutionDouble breakpoints;
  final ResolutionDouble pageMargins;
  final ResolutionDouble gutters;
  final ResolutionDouble banners;
  final ResolutionEdgeInset cardMargins;
  final ResolutionEdgeInset cardPadding;
  final ResolutionEdgeInset cardTitleMargins;
  final ResolutionDouble cardMaxWidth;
}

class AdaptiveDisplay {
  const AdaptiveDisplay({
    this.options = const DisplayOptions(),
  });

  final DisplayOptions options;

  /// The horizontal margin used at various breakpoints
  double get pageMargin {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.pageMargins.smallest;
      case DisplaySize.small:
        return translateDouble(
          currentDimen: options.pageMargins.small,
          nextDimen: options.pageMargins.medium,
          lastDimen: options.pageMargins.smallest,
          lastBreakpoint: options.breakpoints.smallest,
          nextBreakpoint: options.breakpoints.medium,
        );
      case DisplaySize.medium:
        return translateDouble(
          currentDimen: options.pageMargins.medium,
          nextDimen: options.pageMargins.large,
          lastDimen: options.pageMargins.small,
          lastBreakpoint: options.breakpoints.small,
          nextBreakpoint: options.breakpoints.large,
        );
      case DisplaySize.large:
        return translateDouble(
          currentDimen: options.pageMargins.large,
          nextDimen: options.pageMargins.xlarge,
          lastDimen: options.pageMargins.medium,
          lastBreakpoint: options.breakpoints.medium,
          nextBreakpoint: options.breakpoints.xlarge,
        );
      case DisplaySize.xLarge:
        return options.pageMargins.xlarge;
    }
  }

  /// The horizontal padding used at various breakpoints, called gutter in the figma files
  double get padding {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.gutters.smallest;
      case DisplaySize.small:
        return options.gutters.small;
      case DisplaySize.medium:
        return options.gutters.medium;
      case DisplaySize.large:
        return options.gutters.large;
      case DisplaySize.xLarge:
        return options.gutters.xlarge;
    }
  }

  EdgeInsets translateEdgeInsets({
    required EdgeInsets current,
    required EdgeInsets last,
    required EdgeInsets next,
    required double lastBreakpoint,
    required double nextBreakpoint,
  }) {
    return current.copyWith(
      left: translateDouble(
        currentDimen: current.left,
        lastDimen: last.left,
        nextDimen: next.left,
        lastBreakpoint: lastBreakpoint,
        nextBreakpoint: nextBreakpoint,
      ),
      top: translateDouble(
        currentDimen: current.top,
        lastDimen: last.top,
        nextDimen: next.top,
        lastBreakpoint: lastBreakpoint,
        nextBreakpoint: nextBreakpoint,
      ),
      right: translateDouble(
        currentDimen: current.right,
        lastDimen: last.right,
        nextDimen: next.right,
        lastBreakpoint: lastBreakpoint,
        nextBreakpoint: nextBreakpoint,
      ),
      bottom: translateDouble(
        currentDimen: current.bottom,
        lastDimen: last.bottom,
        nextDimen: next.bottom,
        lastBreakpoint: lastBreakpoint,
        nextBreakpoint: nextBreakpoint,
      ),
    );
  }

  double translateDouble({
    required double currentDimen,
    required double lastDimen,
    required double nextDimen,
    required double lastBreakpoint,
    required double nextBreakpoint,
  }) {
    var bDiff = nextDimen - currentDimen;
    var bpDiff = nextBreakpoint - breakpoint;
    var wDiff = w - lastBreakpoint;

    return currentDimen + (bDiff * (wDiff / bpDiff));
  }

  double get cardMaxWidth {
    switch (displaySize) {
      case DisplaySize.smallest:
        var val = options.cardMaxWidth.smallest;
        if (val == 0) {
          return w;
        }
        return options.cardMaxWidth.smallest;
      case DisplaySize.small:
        return translateDouble(
          currentDimen: options.cardMaxWidth.small,
          nextDimen: options.cardMaxWidth.medium,
          lastDimen: options.cardMaxWidth.smallest,
          lastBreakpoint: options.breakpoints.smallest,
          nextBreakpoint: options.breakpoints.medium,
        );
      case DisplaySize.medium:
        return translateDouble(
          currentDimen: options.cardMaxWidth.medium,
          nextDimen: options.cardMaxWidth.large,
          lastDimen: options.cardMaxWidth.small,
          lastBreakpoint: options.breakpoints.small,
          nextBreakpoint: options.breakpoints.large,
        );
      case DisplaySize.large:
        return translateDouble(
          currentDimen: options.cardMaxWidth.large,
          nextDimen: options.cardMaxWidth.xlarge,
          lastDimen: options.cardMaxWidth.medium,
          lastBreakpoint: options.breakpoints.medium,
          nextBreakpoint: options.breakpoints.xlarge,
        );
      case DisplaySize.xLarge:
        return options.cardMaxWidth.xlarge;
    }
  }

  double get breakpoint {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.breakpoints.smallest;
      case DisplaySize.small:
        return options.breakpoints.small;
      case DisplaySize.medium:
        return options.breakpoints.medium;
      case DisplaySize.large:
        return options.breakpoints.large;
      case DisplaySize.xLarge:
        return options.breakpoints.xlarge;
    }
  }

  double get lastBreakpoint {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.breakpoints.smallest;
      case DisplaySize.small:
        return options.breakpoints.smallest;
      case DisplaySize.medium:
        return options.breakpoints.small;
      case DisplaySize.large:
        return options.breakpoints.medium;
      case DisplaySize.xLarge:
        return options.breakpoints.large;
    }
  }

  /// The horizontal padding for an OLB info card
  /// OAO uses different padding, FYI

  EdgeInsets get cardPadding {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.cardPadding.smallest;
      case DisplaySize.small:
        return translateEdgeInsets(
          current: options.cardPadding.small,
          next: options.cardPadding.medium,
          last: options.cardPadding.smallest,
          lastBreakpoint: options.breakpoints.smallest,
          nextBreakpoint: options.breakpoints.medium,
        );
      case DisplaySize.medium:
        return translateEdgeInsets(
          current: options.cardPadding.medium,
          next: options.cardPadding.large,
          last: options.cardPadding.small,
          lastBreakpoint: options.breakpoints.small,
          nextBreakpoint: options.breakpoints.large,
        );
      case DisplaySize.large:
        return translateEdgeInsets(
          current: options.cardPadding.large,
          next: options.cardPadding.xlarge,
          last: options.cardPadding.medium,
          lastBreakpoint: options.breakpoints.medium,
          nextBreakpoint: options.breakpoints.xlarge,
        );
      case DisplaySize.xLarge:
        return options.cardPadding.xlarge;
    }
  }

  EdgeInsets get cardTitleMargins {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.cardTitleMargins.smallest;
      case DisplaySize.small:
        return translateEdgeInsets(
          current: options.cardTitleMargins.small,
          next: options.cardTitleMargins.medium,
          last: options.cardTitleMargins.smallest,
          lastBreakpoint: options.breakpoints.smallest,
          nextBreakpoint: options.breakpoints.medium,
        );
      case DisplaySize.medium:
        return translateEdgeInsets(
          current: options.cardTitleMargins.medium,
          next: options.cardTitleMargins.large,
          last: options.cardTitleMargins.small,
          lastBreakpoint: options.breakpoints.small,
          nextBreakpoint: options.breakpoints.large,
        );
      case DisplaySize.large:
        return translateEdgeInsets(
          current: options.cardTitleMargins.large,
          next: options.cardTitleMargins.xlarge,
          last: options.cardTitleMargins.medium,
          lastBreakpoint: options.breakpoints.medium,
          nextBreakpoint: options.breakpoints.xlarge,
        );
      case DisplaySize.xLarge:
        return options.cardTitleMargins.xlarge;
    }
  }

  EdgeInsets get cardMargin {
    switch (displaySize) {
      case DisplaySize.smallest:
        return options.cardMargins.smallest;
      case DisplaySize.small:
        return translateEdgeInsets(
          current: options.cardMargins.small,
          next: options.cardMargins.medium,
          last: options.cardMargins.smallest,
          lastBreakpoint: options.breakpoints.smallest,
          nextBreakpoint: options.breakpoints.medium,
        );
      case DisplaySize.medium:
        return translateEdgeInsets(
          current: options.cardMargins.medium,
          next: options.cardMargins.large,
          last: options.cardMargins.small,
          lastBreakpoint: options.breakpoints.small,
          nextBreakpoint: options.breakpoints.large,
        );
      case DisplaySize.large:
        return translateEdgeInsets(
          current: options.cardMargins.large,
          next: options.cardMargins.xlarge,
          last: options.cardMargins.medium,
          lastBreakpoint: options.breakpoints.medium,
          nextBreakpoint: options.breakpoints.xlarge,
        );
      case DisplaySize.xLarge:
        return options.cardMargins.xlarge;
    }
  }

  /// The padding used for the top banner (i.e. the Account Banner)
  /// There are only two sizes, mobile and laptop (40 and 80 px, respectively)
  double get bannerPadding {
    switch (displaySize) {
      case DisplaySize.smallest:
      case DisplaySize.small:
      case DisplaySize.medium:
        return options.banners.smallest;
      case DisplaySize.large:
      case DisplaySize.xLarge:
        return options.banners.xlarge;
    }
  }

  static WidgetsBinding get binding =>
      WidgetsFlutterBinding.ensureInitialized();

  static double get devicePixelRatio => binding.window.devicePixelRatio;

  static Size get size => binding.window.physicalSize;

  static double get w => size.width / devicePixelRatio;

  static double get h => size.height / devicePixelRatio;

  bool get isSmallest => w <= options.breakpoints.smallest;

  bool get isNative => isAndroid || isIos;

  bool get isNativeMobile => isAndroidMobile || isIosMobile;

  bool get isIos => defaultTargetPlatform == TargetPlatform.iOS;

  bool get isIosMobile =>
      defaultTargetPlatform == TargetPlatform.iOS && isSmallest;

  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  bool get isAndroidMobile =>
      defaultTargetPlatform == TargetPlatform.android && isSmallest;

  bool get isWeb => kIsWeb;

  bool get isWebMobile => kIsWeb && isSmallest;

  bool get isSmall =>
      w > options.breakpoints.smallest && w <= options.breakpoints.small;

  bool get isMedium =>
      w > options.breakpoints.small && w <= options.breakpoints.medium;

  bool get isLarge =>
      w > options.breakpoints.medium && w <= options.breakpoints.large;

  bool get isXLarge => w > options.breakpoints.large;

  DisplaySize get displaySize {
    if (isSmallest) return DisplaySize.smallest;
    if (isSmall) return DisplaySize.small;
    if (isMedium) return DisplaySize.medium;
    if (isLarge) return DisplaySize.large;
    if (isXLarge) return DisplaySize.xLarge;

    return DisplaySize.smallest;
  }

  double get gutter {
    if (isSmallest) return options.gutters.smallest;
    if (isSmall) return options.gutters.small;

    return options.gutters.medium;
  }
}
