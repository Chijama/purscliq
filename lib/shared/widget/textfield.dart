import 'package:flutter/material.dart';

import '../textstyles.dart';

class TextForm extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixWidget;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int? maximumLines;

  const TextForm({
    this.labelText = "",
    this.hintText = "",
    this.controller,
    this.obscureText = false,
    this.suffixWidget,
    this.validator,
    this.fillColor,
    this.keyboardType,
    this.maximumLines,
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
              maxLines: maximumLines,
              keyboardType: keyboardType,
              //  autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              controller: controller,
              obscureText: obscureText!,
              decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: true,
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
                  hintText: hintText,
                  hintStyle:
                      kBlue1TextStyle.copyWith(color: Colors.grey.shade300))),
        )
      ],
    );
  }
}
