import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flygpt_flutter/shared/adaptive_display.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    required this.body,
    this.showAppBar = false,
    this.showFooter = false,
    this.contentMaxWidth,
    this.contentPadding,
    this.contentMargin,
    this.appBar,
    this.backgroundWidget,
    this.backgroundColor,
  });

  final Widget Function(BuildContext, int) body;
  final PreferredSizeWidget? appBar;
  final bool showAppBar;
  final bool showFooter;
  final double? contentMaxWidth;
  final EdgeInsets? contentPadding;
  final EdgeInsets? contentMargin;
  final Widget? backgroundWidget;
  final Color? backgroundColor;

  static final ValueNotifier<int> _activeIndex = ValueNotifier(0);

  static void setActiveTab(int index) {
    _activeIndex.value = index;
  }

  static int get activeIndex {
    return _activeIndex.value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        maintainBottomViewPadding: true,
        child: Stack(
          children: [
            if (backgroundWidget != null)
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: backgroundWidget!,
              ),
            SelectionArea(
                child: Scaffold(
              backgroundColor: backgroundColor ?? Colors.transparent,
              extendBodyBehindAppBar: true,
              extendBody: false,
              appBar: showAppBar ? appBar : null,
              body: LayoutBuilder(builder: (context, _) {
                final padding = MediaQuery.paddingOf(context);
                final height = MediaQuery.sizeOf(context).height -
                    padding.top -
                    padding.bottom;
                final safeArea = height + (appBar?.preferredSize.height ?? 0);

                return Container(
                  height: kIsWeb ? safeArea : double.infinity,
                  margin: !Display.isSmallest
                      ? EdgeInsets.only(top: padding.top)
                      : null,
                  child: ValueListenableBuilder<int>(
                      valueListenable: _activeIndex,
                      builder: (context, tabIndex, _) {
                        return body(context, tabIndex);
                      }),
                );
              }),
            )),
          ],
        ));
  }
}
