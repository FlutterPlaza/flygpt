// import 'package:flutter/material.dart';
// import 'package:rmpa_flutter/shared/adaptive_display.dart';
// import 'package:rmpa_flutter/shared/platform_layouts/_router_index.dart';
//
// class Layouts extends StatelessWidget {
//   const Layouts({
//     super.key,
//     required this.mobileLayout,
//     required this.desktopLayout,
//   });
//
//   final Widget mobileLayout;
//   final Widget desktopLayout;
//   final int numberOrChildRoute = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return RouterIndex(
//       numberOrChildRoute: numberOrChildRoute,
//       child: switch (Display.isSmallest) {
//         true => mobileLayout,
//         false => mobileLayout,
//       },
//     );
//   }
// }
