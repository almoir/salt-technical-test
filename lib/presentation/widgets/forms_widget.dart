import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final double width;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isShowTitle;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget suffixIcon;
  final Function(String? value)? onSaved;
  final bool needValidate;
  final Function? functionValidate;
  final bool readOnly;
  final String? initialValue;
  final String suffixTitle;
  final TextInputAction textInputAction;
  final VoidCallback? onTap;

  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.width = double.infinity,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.isShowTitle = true,
    this.prefixIcon,
    this.suffixIcon = const SizedBox(),
    this.onSaved,
    this.maxLength,
    required this.needValidate,
    this.functionValidate,
    this.readOnly = false,
    this.initialValue,
    this.suffixTitle = '',
    this.textInputAction = TextInputAction.next,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: null,
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
              ),
              Text(
                needValidate == true ? ' *' : '',
                style: blackTextStyle.copyWith(
                    fontWeight: medium, color: redColor),
              ),
            ],
          ),
        if (isShowTitle) const SizedBox(height: 5),
        Column(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                color: lightBGColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: mainColors,
                    offset: const Offset(1.0, 2.0),
                  ),
                ],
              ),
              child: TextFormField(
                obscureText: obscureText,
                controller: controller,
                keyboardType: keyboardType,
                initialValue: initialValue,
                maxLength: maxLength,
                readOnly: readOnly,
                textInputAction: textInputAction,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: !isShowTitle ? title : null,
                  hintStyle: greyTextStyle,
                  suffixIconColor: mainColors,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  fillColor: mainColors,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColors),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColors, width: 4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColors),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColors, width: 4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorMaxLines: null,
                ),
                onSaved: onSaved,
                validator: needValidate == false
                    ? functionValidate != null
                        ? (value) {
                            if (functionValidate != null) {
                              return functionValidate!();
                            }
                            return null;
                          }
                        : null
                    : (value) {
                        if (value != null && value.trim().isEmpty) {
                          return "OOPS! $title Can't be Empty.";
                        }
                        if (functionValidate != null) {
                          return functionValidate!();
                        }
                        return null;
                      },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class PrefixWidget extends StatelessWidget {
  const PrefixWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: VerticalDivider(
                color: mainColors,
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuffixWidget extends StatelessWidget {
  const SuffixWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String title;
  final String value;
  final bool needValidate;
  final bool isShowTitle;
  final Function(String? newValue) onChanged;
  final List<String> items;
  final Function(String? value)? onSaved;
  final AutovalidateMode autovalidateMode;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.value,
    required this.needValidate,
    required this.items,
    required this.onChanged,
    this.isShowTitle = true,
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isShowTitle)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: null,
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
                Text(
                  needValidate == true ? ' *' : '',
                  style: blackTextStyle.copyWith(
                      fontWeight: medium, color: redColor),
                ),
              ],
            ),
          if (isShowTitle)
            const SizedBox(
              height: 8,
            ),
          DropdownButtonFormField(
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            hint: Text("- Pilih $title -"),
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.indigo,
                  width: 2,
                ),
              ),
            ),
            value: value == '' ? null : value,
            items: items
                .map((label) =>
                    DropdownMenuItem(value: label, child: Text(label)))
                .toList(),
            onChanged: onChanged,
            validator: (e) {
              if (needValidate == true) {
                if (e == null) {
                  return "$title tidak boleh kosong.";
                } else {
                  return null;
                }
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
