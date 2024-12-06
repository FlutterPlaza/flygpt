import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flygpt_flutter/screens/dashboard/layout/mobile_dashboard_page.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // context.read<ChatHistoryBloc>().add(const ChatHistoryEvent.init());
    MediaQuery.sizeOf(context);
    return MobileDashboardPage();

  }
}
