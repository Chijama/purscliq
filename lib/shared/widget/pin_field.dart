import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';

class pinField extends StatelessWidget {
  pinField({required this.controller,this.textInputAction, Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        textInputAction: textInputAction ?? TextInputAction.next,
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
            counterText: '',
            fillColor: AppColor.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 0, color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 0, color: Colors.grey.shade300),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 0, color: AppColor.blue),
            ),
            hintStyle: kBlue1TextStyle.copyWith(color: Colors.grey.shade300)),
      ),
    );
  }
}
