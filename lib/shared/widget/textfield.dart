import 'package:flutter/material.dart';

import 'package:purscliq_app/shared/textstyles.dart';

class TextForm extends StatelessWidget {
  String text;
  final String hintText;
  final TextEditingController controller ;
  final bool obscureText;
  TextForm(this.text, this.hintText, this.controller, this.obscureText,{super.key});
  

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
            controller: controller ,
            obscureText: obscureText ,
              decoration: InputDecoration(
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
