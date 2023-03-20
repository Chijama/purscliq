import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';
import 'package:purscliq_app/shared/widget/button.dart';

import 'package:purscliq_app/shared/widget/textform.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController messageEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    textEditingController.dispose();
    messageEditingController.dispose();
    super.dispose();
  }

  Widget options(String text, BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                textEditingController.text = text;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //height: ,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColor.lightgrey),
              child: Text(text),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            title: "Help And Support",
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(12, 32, 12, 0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextForm(
                    readOnly: true,
                    validator: (category) {
                      if (category!.isEmpty) {
                        return "Please select a category";
                      } else {
                        return null;
                      }
                    },
                    hintText: textEditingController.text,
                    controller: textEditingController,
                    labelText: "Select Category",
                    suffixWidget: IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 0),
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 3,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: AppColor.grey),
                                        ),
                                        options("Transaction Failure", context),
                                        options("Bill Payments", context),
                                        options("Technical", context),
                                      ],
                                    ),
                                  ));
                            });
                      },
                    ),
                  ),
                  TextForm(
                      readOnly: false,
                      labelText: 'Message',
                      maximumLines: 3,
                      validator: (message) {
                        if (message!.isEmpty) {
                          return "Please enter a message";
                        } else {
                          return null;
                        }
                      }),
                  CustomButton(
                    label: "Send",
                    onPressed: () {
                      // final snackBar = SnackBar(
                      //   content: Text(
                      //     "Message sent Successfully",
                      //     style: kGreenStatusTextStyle,
                      //   ),
                      //   backgroundColor: AppColor.white,
                      // );
                      // final snackBar2 = SnackBar(
                      //   content: Text(
                      //     "Message not sent",
                      //     style: kRedStatusTextStyle,
                      //   ),
                      //   backgroundColor: AppColor.white,
                      // );
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                contentPadding:
                                    const EdgeInsets.only(top: 10.0),
                                content: SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(80),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.green.shade200)),
                                        child: const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.green,
                                          size: 24,
                                        ),
                                      ),
                                      Text(
                                        "Message sent successfully",
                                        style: kAlertTitleTextStyle,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        'Thank you for your feedback',
                                        style: kAlertContentTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
