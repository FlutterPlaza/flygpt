import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.backgroundImage,
    this.title,
    this.leading,
    this.actions,
    this.elevation,
    this.padding,
    this.bodyTopMargin,
    this.showAppBar = false,
    this.leadingWidth,
    this.appBarBackgroundColor,
    this.backgroundColor,
    this.appBar,
    this.appBarHeight,
  });

  final Widget Function(BuildContext, int) body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? backgroundImage;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final double? padding;
  final double? bodyTopMargin;
  final double? appBarHeight;
  final double? leadingWidth;
  final Color? appBarBackgroundColor;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final bool showAppBar;

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
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: showAppBar
            ? appBar ??
                AppBar(
                  title: title,
                  leading: leading,
                  actions: actions,
                  toolbarHeight: appBarHeight ?? AppBar().preferredSize.height,
                  elevation: elevation,
                  automaticallyImplyLeading: false,
                  backgroundColor: appBarBackgroundColor,
                )
            : null,
        body: Stack(
          children: [
            if (backgroundImage != null) backgroundImage!,
            Align(
              alignment: Alignment.topCenter,
              child: ValueListenableBuilder<int>(
                  valueListenable: _activeIndex,
                  builder: (context, tabIndex, _) {
                    return body(context, tabIndex);
                  }),
            )
          ],
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
