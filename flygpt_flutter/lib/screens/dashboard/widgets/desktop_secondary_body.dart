// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:rmpa_flutter/screens/chat/chat_history_bloc/chat_history_bloc.dart';
// import 'package:rmpa_flutter/screens/chat/new_chat/chat_screen.dart';
// import 'package:rmpa_flutter/screens/notification/notification_screen.dart';
// import 'package:rmpa_flutter/screens/profile/profile_screen.dart';
// import 'package:rmpa_flutter/shared/adaptive_display.dart';
// import 'package:rmpa_flutter/shared/platform_layouts/desktop_layout.dart';
//
// class DesktopSecondaryBody extends StatelessWidget {
//   const DesktopSecondaryBody({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final selectedHistory =
//         context.watch<ChatHistoryBloc>().state.selectedHistory;
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               if (DesktopLayout.activeIndex == 0)
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         PhosphorIconsBold.chatCircleText,
//                         size: ConstSize.iconSize,
//                       ),
//                       onPressed: () {},
//                     ),
//                     Text(selectedHistory?.desc ?? 'New Chat'),
//                   ],
//                 )
//               else
//                 Gap(1),
//               Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.shade100,
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: Row(
//                       children: [
//                         Icon(
//                           PhosphorIconsBold.lightbulbFilament,
//                           size: ConstSize.iconSize,
//                         ),
//                         Text('Creative mode'),
//                         Icon(Icons.keyboard_arrow_down_rounded),
//                       ],
//                     ),
//                     // onPressed: () {},
//                   ),
//                   Gap(10),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.shade100,
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: Row(
//                       children: [
//                         Icon(
//                           PhosphorIconsBold.plugsConnected,
//                           size: ConstSize.iconSize,
//                         ),
//                         Text('Plugins'),
//                         Icon(Icons.keyboard_arrow_down_rounded),
//                       ],
//                     ),
//                     // onPressed: () {},
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.9,
//             child: switch (DesktopLayout.activeIndex) {
//               0 => ChatScreen(
//                   history: selectedHistory,
//                   showAppBar: false,
//                 ),
//               1 => NotificationScreen(),
//               2 => ProfileScreen(),
//               _ => Container(),
//             }),
//       ],
//     );
//   }
// }
