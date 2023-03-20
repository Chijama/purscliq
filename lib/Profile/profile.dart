import 'package:flutter/material.dart';

// import 'package:purscliq_app/Profile/change_cliq_id.dart';
// import 'package:purscliq_app/Profile/change_password.dart';
// import 'package:purscliq_app/Profile/edit_profile.dart';
// import 'package:purscliq_app/Profile/change_pin.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            title: "Profile", automaticallyImplyLeading: true),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            children: [
              CustomPageLink(
                  text: "Change Password",
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ChangePassword()));
                  }),
              CustomPageLink(
                  text: "Edit Profile",
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                            // builder: (context) => const EditProfile()));
                  }),
              CustomPageLink(
                  text: "Change Cliq ID",
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                            // builder: (context) => const ChangeCliqID()));
                  }),
              CustomPageLink(
                  text: "Change Pin",
                  onTap: () {
                    // const ChangePin();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPageLink extends StatelessWidget {
  const CustomPageLink({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade200,
          thickness: 0,
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: kBlack2TextStyle,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.grey,
                      size: 13,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
