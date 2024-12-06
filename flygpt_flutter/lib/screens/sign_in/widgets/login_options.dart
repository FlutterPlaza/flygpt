import 'package:flutter/material.dart';
import 'package:flygpt_flutter/shared/adaptive_display.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          height: ConstSize.buttonHeight,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: ConstSize.borderRadius,
          ),
          child: IconButton(
            icon: Image.asset(
              'assets/images/icons/google-logo.png',
              color: Colors.white,
              height: 25,
            ),
            onPressed: () {},
          ),
        ),
        Container(
          width: 100,
          height: ConstSize.buttonHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: ConstSize.borderRadius,
          ),
          child: IconButton(
            icon: Image.asset(
              'assets/images/icons/apple-logo.png',
              color: Colors.black,
              height: 25,
            ),
            onPressed: () {},
          ),
        ),
        Container(
          width: 100,
          height: ConstSize.buttonHeight,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: ConstSize.borderRadius,
          ),
          child: IconButton(
            icon: Image.asset(
              'assets/images/icons/facebook-logo.png',
              color: Colors.white,
              height: 25,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
