import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';

import '../textstyles.dart';

class TextForm extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int? maximumLines;
  final bool readOnly;
  final TextStyle? style;

  const TextForm({
    this.labelText = "",
    this.hintText = "",
    this.controller,
    this.obscureText = false,
    this.suffixWidget,
    this.prefixWidget,
    this.validator,
    this.fillColor,
    this.keyboardType,
    this.maximumLines,
    this.style,
    required this.readOnly,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? "",
          style: kBlack3TextStyle,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
          child: TextFormField(
              style: style,
              readOnly: readOnly,
              maxLines: obscureText! ? 1 : maximumLines,
              keyboardType: keyboardType,
              //  autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              controller: controller,
              obscureText: obscureText!,
              decoration: InputDecoration(
                  fillColor: readOnly ? AppColor.lightgrey : AppColor.white,
                  filled: true,
                  prefixIcon: prefixWidget,
                  suffixIcon: suffixWidget,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 0,
                        color: readOnly ? Colors.grey.shade300 : AppColor.blue),
                  ),
                  hintText: hintText,
                  hintStyle:
                      kBlue1TextStyle.copyWith(color: Colors.grey.shade300))),
        )
      ],
    );
  }
}
