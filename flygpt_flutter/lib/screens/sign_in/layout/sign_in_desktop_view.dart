// import 'package:flutter/material.dart';
// import 'package:rmpa_flutter/screens/sign_in/layout/sign_in_mobile_view.dart';
// import 'package:rmpa_flutter/shared/adaptive_display.dart';
// import 'package:rmpa_flutter/shared/platform_layouts/desktop_layout.dart';
//
// class DesktopSignInPage extends StatelessWidget {
//   const DesktopSignInPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return DesktopLayout(
//       backgroundColor: Colors.white,
//       body: (c, _) => Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Row(
//                     children: [
//                       Hero(tag: 'logo', child: FlutterLogo()),
//                       Text(
//                         'FlyGPT',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Product'),
//                       Text('Solutions'),
//                       Text('Resources'),
//                       Text('Download'),
//                       Text('Pricing'),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         onPressed: null,
//                         child: Text('Sign In'),
//                       ),
//                       ElevatedButton(
//                         onPressed: null,
//                         child: Text('Sign Up'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Center(
//             child: ClipRRect(
//               borderRadius: ConstSize.borderRadius,
//               child: SizedBox(
//                 height: size.height * 0.6,
//                 width: size.width * 0.5,
//                 child: MobileSignInPage(
//                   showAppName: false,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: Display.cardPadding,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '@2024 FlyGPT',
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       showAppBar: true,
//       showFooter: true,
//     );
//   }
// }
