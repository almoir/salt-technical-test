import 'package:flutter/material.dart';

import '../../config/theme.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final IconData icon;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets margin;
  final Color backgroundColor;
  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.width = double.infinity,
    this.height = 50,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = const Color(0xff5e07a0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: whiteColor,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: whiteTextStyle.copyWith(
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsets margin;
  final TextStyle? textStyle;
  final Color textColor;

  const CustomTextButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width = double.infinity,
      this.height = 24,
      this.fontSize = 16,
      this.margin = EdgeInsets.zero,
      this.textStyle,
      this.textColor = const Color(0xff14193F)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          title,
          style: textStyle ??
              blackTextStyle.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  decoration: TextDecoration.underline,
                  fontWeight: semiBold),
        ),
      ),
    );
  }
}

class CustomNumberButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomNumberButton(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: title == "Hapus" || title == "Enter" ? 14 : 20,
            ),
          ),
        ),
      ),
    );
  }
}
