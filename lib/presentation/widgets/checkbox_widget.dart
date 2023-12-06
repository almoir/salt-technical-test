import 'package:flutter/material.dart';

import '../../config/theme.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isShowDescription = true,
  }) : super(key: key);
  final bool value;
  final Function(bool? value) onChanged;
  final bool isShowDescription;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: whiteColor,
          shape: const CircleBorder(),
          value: widget.value,
          onChanged: widget.onChanged,
        ),
        widget.isShowDescription
            ? Expanded(
                child: Text(
                  "I have read and agreed to the Privacy Policy, Terms of Use, and Authorization from Salt",
                  maxLines: null,
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
