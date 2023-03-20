import 'package:flutter/material.dart';
import 'package:purscliq_app/Profile/profile.dart';
import 'package:purscliq_app/account_information.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'More',
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
        child: Column(
          children: [
            CustomPageLink(
                leadingIcon: Icons.info_outline_rounded,
                text: "Account Information",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountInformation()));
                }),
            CustomPageLink(
                leadingIcon: Icons.person_3_rounded,
                text: "Profile",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                }),
            CustomPageLink(
                leadingIcon: Icons.notifications,
                text: "Notification Settings",
                onTap: () {}),
            CustomPageLink(
                leadingIcon: Icons.bar_chart_outlined,
                text: "Earnings",
                onTap: () {}),
            CustomPageLink(
                leadingIcon: Icons.share_outlined,
                text: "Referral",
                onTap: () {}),
            CustomPageLink(
                leadingIcon: Icons.fingerprint_rounded,
                text: "Biometric Settings",
                onTap: () {}),
            CustomPageLink(
                leadingIcon: Icons.privacy_tip_outlined,
                text: "Privacy Policy",
                onTap: () {}),
            CustomPageLink(
                leadingIcon: Icons.info_outline_rounded,
                text: "SignOut",
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class CustomPageLink extends StatelessWidget {
  const CustomPageLink({
    Key? key,
    required this.leadingIcon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData leadingIcon;

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
                    Row(children: [
                      Icon(
                        leadingIcon,
                        color: AppColor.blue,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        text,
                        style: kBlack2TextStyle,
                      ),
                    ]),
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
