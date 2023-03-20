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
            _custom_page_link(
                leadingIcon: Icons.info_outline_rounded,
                text: "Account Information",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountInformation()));
                }),
            _custom_page_link(
                leadingIcon: Icons.person_3_rounded,
                text: "Profile",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                }),
            _custom_page_link(
                leadingIcon: Icons.notifications,
                text: "Notification Settings",
                onTap: () {}),
            _custom_page_link(
                leadingIcon: Icons.bar_chart_outlined,
                text: "Earnings",
                onTap: () {}),
            _custom_page_link(
                leadingIcon: Icons.share_outlined,
                text: "Referral",
                onTap: () {}),
            _custom_page_link(
                leadingIcon: Icons.fingerprint_rounded,
                text: "Biometric Settings",
                onTap: () {}),
            _custom_page_link(
                leadingIcon: Icons.privacy_tip_outlined,
                text: "Privacy Policy",
                onTap: () {}),
            _custom_page_link(
                leadingIcon: Icons.info_outline_rounded,
                text: "SignOut",
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _custom_page_link extends StatelessWidget {
  const _custom_page_link({
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
