// import 'package:flutter/material.dart';
// import 'package:rmpa_flutter/screens/dashboard/widgets/desktop_primary_body.dart';
// import 'package:rmpa_flutter/screens/dashboard/widgets/desktop_secondary_body.dart';
// import 'package:rmpa_flutter/screens/dashboard/widgets/secondary_navigation.dart';
// import 'package:rmpa_flutter/shared/adaptive_display.dart';
// import 'package:rmpa_flutter/shared/platform_layouts/desktop_layout.dart';
//
// class DesktopDashboardPage extends StatelessWidget {
//   const DesktopDashboardPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return DesktopLayout(
//       body: (context, tab) => SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: PrimaryBody(),
//                 ),
//                 Expanded(
//                   flex: 9,
//                   child: DesktopSecondaryBody(),
//                 ),
//                 if(!Display.isSmallest && !Display.isSmall )
//                 SecondaryNavigation(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
