import 'package:flutter/material.dart';

import '../../config/theme.dart';

class TopMerchantItem extends StatelessWidget {
  final String imageUrl;
  final String merchant;
  const TopMerchantItem(
      {required this.imageUrl, required this.merchant, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10, bottom: 5),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Center(
            child: Image.asset(
              imageUrl,
              width: 75,
            ),
          ),
        ),
      ],
    );
  }
}
