import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_flutter/main.dart';
import 'package:flygpt_flutter/routes/app_router.gr.dart';
import 'package:flygpt_flutter/screens/shared_widgets/mobile_bottom_navbar.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:flygpt_flutter/shared/platform_layouts/mobile_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MobileDashboardPage extends StatelessWidget {
  const MobileDashboardPage({
    super.key,
    this.showAppBar = true,
    this.showFloatingActionButton = true,
  });

  final bool showAppBar;
  final bool showFloatingActionButton;

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      showAppBar: showAppBar,
      backgroundColor: Constants.colors(context).of.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(PhosphorIconsBold.listBullets),
        onPressed: () {},
      ),
      title: Text(
        'Home',
        style: Constants.texts(context).of.titleLarge,
      ),
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsBold.signOut),
          onPressed: () {
            podClient.sessionManager.signOutDevice();
          },
        ),
      ],
      body: (context, tab) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: switch (tab) {
          0 => Center(
              child: Text('Chat History'),
            ),
          1 => Center(
              child: Text('Notification Screen'),
            ),
          2 => Center(
              child: Text('Profile Screen'),
            ),
          _ => Container(),
        },
      ),
      floatingActionButton: !showFloatingActionButton
          ? null
          : FloatingActionButton(
              backgroundColor: Constants.colors(context).of.accentColor,
              onPressed: () {
                context.router.push(ChatRoute());
              },
              child: const Icon(
                PhosphorIconsBold.plusCircle,
                color: Colors.white,
              ),
            ),
      bottomNavigationBar: MobileBottomNavBar(),
    );
  }
}
