import 'package:flutter/material.dart';

import '../../config/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String time;
  final String value;
  const HomeLatestTransactionItem(
      {required this.iconUrl,
      required this.title,
      required this.time,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(iconUrl),
              ),
            ),
          ),
          title: Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          subtitle: Text(
            time,
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
          trailing: Text(
            value,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
