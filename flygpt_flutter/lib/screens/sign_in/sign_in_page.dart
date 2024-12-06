import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flygpt_flutter/screens/sign_in/layout/sign_in_mobile_view.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return MobileSignInPage();
  }
}
