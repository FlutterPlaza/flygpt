

import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({
    super.key,
  });

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double logoSize = 80;
  double logoSizeSmall = 80;
  double logoSizeLarge = 120;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (logoSize == logoSizeSmall) {
        logoSize = logoSizeLarge;
      } else {
        logoSize = logoSizeSmall;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: logoSizeLarge,
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        height: logoSize,
        width: logoSize,
        child: Hero(
          tag: 'logo',
          child: FlutterLogo(
            size: logoSize,
          ),
        ),
      ),
    );
  }
}
