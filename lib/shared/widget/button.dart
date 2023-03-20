import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final void Function()? onPressed;

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blue,
                minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            child: Text(
              widget.label,
              style: kBlack2TextStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
