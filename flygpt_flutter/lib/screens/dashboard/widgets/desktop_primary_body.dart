// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:rmpa_flutter/screens/dashboard/layout/mobile_dashboard_page.dart';
// import 'package:rmpa_flutter/shared/adaptive_display.dart';
// import 'package:rmpa_flutter/screens/chat/chat_history_bloc/chat_history_bloc.dart';
//
// class PrimaryBody extends StatelessWidget {
//   const PrimaryBody({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(PhosphorIconsBold.list),
//               onPressed: () {},
//             ),
//             FlutterLogo(),
//             Text('FlyGPT'),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: InkWell(
//             onTap: () {
//               context
//                   .read<ChatHistoryBloc>()
//                   .add(const ChatHistoryEvent.setSelectedHistory(null));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey.shade100,
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Row(
//                 children: [
//                   Icon(
//                     PhosphorIconsBold.plusCircle,
//                     size: ConstSize.iconSize,
//                   ),
//                   Gap(10),
//                   Text('New Chat'),
//                 ],
//               ),
//               // onPressed: () {},
//             ),
//           ),
//         ),
//         Container(
//             height: MediaQuery.sizeOf(context).height * 0.86,
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: MobileDashboardPage(
//                 showAppBar: false,
//                 showFloatingActionButton: false,
//               ),
//             )),
//       ],
//     );
//   }
// }
