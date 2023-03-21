import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/button.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';
import 'package:purscliq_app/shared/widget/pin_field.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  TextEditingController oldPin1Controller = TextEditingController();
  TextEditingController oldPin2Controller = TextEditingController();
  TextEditingController oldPin3Controller = TextEditingController();
  TextEditingController oldPin4Controller = TextEditingController();
  TextEditingController newPin1Controller = TextEditingController();
  TextEditingController newPin2Controller = TextEditingController();
  TextEditingController newPin3Controller = TextEditingController();
  TextEditingController newPin4Controller = TextEditingController();
  TextEditingController confirmPin1Controller = TextEditingController();
  TextEditingController confirmPin2Controller = TextEditingController();
  TextEditingController confirmPin3Controller = TextEditingController();
  TextEditingController confirmPin4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Change pin', automaticallyImplyLeading: true),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Old Pin",
                  style: kBlack3TextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pinField(controller: oldPin1Controller),
                        const SizedBox(width: 20),
                        pinField(controller: oldPin2Controller),
                        const SizedBox(width: 20),
                        pinField(controller: oldPin3Controller),
                        const SizedBox(width: 20),
                        pinField(
                          controller: oldPin4Controller,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "New Pin",
                  style: kBlack3TextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pinField(controller: newPin1Controller),
                        const SizedBox(width: 20),
                        pinField(controller: newPin2Controller),
                        const SizedBox(width: 20),
                        pinField(controller: newPin3Controller),
                        const SizedBox(width: 20),
                        pinField(
                          controller: newPin4Controller,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Confirm New Pin",
                  style: kBlack3TextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pinField(controller: confirmPin1Controller),
                        const SizedBox(width: 20),
                        pinField(controller: confirmPin2Controller),
                        const SizedBox(width: 20),
                        pinField(controller: confirmPin3Controller),
                        const SizedBox(width: 20),
                        pinField(
                          controller: confirmPin4Controller,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(label: "Change Pin", onPressed: () {})
              ],
            ),
          )),
    );
  }
}
