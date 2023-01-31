import 'package:flutter/material.dart';

import 'package:purscliq_app/shared/textstyles.dart';

class TextForm extends StatelessWidget {
  TextForm(this.text, this.hintText, {super.key});
  String text;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: kBlack3TextStyle,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 14),
          child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade300),
                  ),
                  hintText: hintText)),
        )
      ],
    );
  }
}
