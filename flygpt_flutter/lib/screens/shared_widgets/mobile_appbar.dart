import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flygpt_flutter/main.dart';
import 'package:flygpt_flutter/routes/app_router.dart';
import 'package:flygpt_flutter/routes/app_router.gr.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(PhosphorIconsBold.list),
            onPressed: () {},
          ),
          Text(
            'Home',
            style: Constants.texts(context).of.titleLarge,
          ),
          IconButton(
            icon: const Icon(PhosphorIconsBold.signOut),
            onPressed: () {
              podClient.sessionManager.signOutDevice();
              context.router.navigate(const SignInRoute());
            },
          ),
        ],
      ),
    );
  }
}