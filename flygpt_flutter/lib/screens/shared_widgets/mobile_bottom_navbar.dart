import 'package:flutter/material.dart';
import 'package:flygpt_flutter/shared/adaptive_display.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:flygpt_flutter/shared/platform_layouts/mobile_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MobileBottomNavBar extends StatelessWidget {
  const MobileBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Container(
        color: Constants.colors(context).of.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(PhosphorIconsBold.house),
              onPressed: () {
                if (Display.isSmallest) {
                  MobileLayout.setActiveTab(0);
                } else {
                  // DesktopLayout.setActiveTab(0);
                }
              },
            ),
            IconButton(
              icon: Icon(PhosphorIconsBold.bell),
              onPressed: () {
                if (Display.isSmallest) {
                  MobileLayout.setActiveTab(1);
                } else {
                  // DesktopLayout.setActiveTab(1);
                }
              },
            ),
            IconButton(
                onPressed: () {
                  if (Display.isSmallest) {
                    MobileLayout.setActiveTab(2);
                  } else {
                    // DesktopLayout.setActiveTab(2);
                  }
                },
                icon: Icon(PhosphorIconsBold.userCircle))
          ],
        ),
      ),
    );
  }
}
