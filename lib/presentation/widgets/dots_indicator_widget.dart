import 'package:flutter/material.dart';

import '../../config/theme.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? mainColors : greyColor,
      ),
    );
  }
}
