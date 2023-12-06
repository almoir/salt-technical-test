import 'package:flutter/material.dart';

import '../../config/value.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "$assetImagePath/logo.png",
          width: width,
          height: height,
        ),
      ],
    );
  }
}
