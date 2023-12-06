import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final int badge;
  final VoidCallback onTap;
  const ProfileMenuItem({
    super.key,
    required this.iconUrl,
    required this.onTap,
    required this.title,
    this.badge = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Image.asset(iconUrl, width: 25),
            const SizedBox(width: 15),
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
            const Spacer(),
            badge == 0
                ? const SizedBox()
                : Container(
                    width: 25,
                    height: 25,
                    decoration:
                        BoxDecoration(color: blueColor, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "$badge",
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
