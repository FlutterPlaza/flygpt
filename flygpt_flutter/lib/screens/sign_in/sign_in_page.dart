import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_client/flygpt_client.dart';
import 'package:flygpt_flutter/main.dart';
import 'package:flygpt_flutter/screens/sign_in/widgets/animated_logo.dart';
import 'package:flygpt_flutter/screens/sign_in/widgets/login_options.dart';
import 'package:flygpt_flutter/shared/adaptive_display.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class MobileSignInPage extends StatelessWidget {
  const MobileSignInPage({super.key, this.showAppName = true});

  final bool showAppName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(40),
            AnimatedLogo(),
            if (showAppName)
              Text(
                'FlyGPT',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ],
        ),
        Padding(
          padding: Display.cardPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // LoginOptions(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.white,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
              ),
              SizedBox(
                width:
                    Display.isSmallest ? double.infinity : Display.cardMaxWidth,
                height: 50,
                child: SignInWithEmailButton(
                  caller: client.modules.auth,
                  onSignedIn: () {
                    // context.router.replace(DashboardRoute());
                  },
                  icon: Icon(Icons.email_outlined),
                  label: Text('Sign In or Sign up'),
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.white,
                    // onPrimary: Colors.black,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Forgot Password',
                      style: TextStyle(color: Colors.white)),
                  Text('Contact Us', style: TextStyle(color: Colors.white)),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
