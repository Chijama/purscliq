import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purscliq_app/Homepage/homepage_provider.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';
import 'package:purscliq_app/shared/widget/textform.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? imgUrl;
  @override
  void initState() {
    var editProfileState =
        Provider.of<HomepageProvider>(context, listen: false);
    firstNameController.text = editProfileState.firstName!;
    lastNameController.text = editProfileState.lastName!;
    emailController.text = editProfileState.email!;
    phoneNumberController.text = editProfileState.phone!;
    imgUrl = editProfileState.imgUrl;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: "Edit Profile", automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  imgUrl!,
                ),
                radius: 50,
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.camera_alt_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextForm(
              readOnly: false,
              labelText: 'First Name',
              controller: firstNameController,
            ),
            TextForm(
              readOnly: false,
              labelText: 'Last Name',
              controller: lastNameController,
            ),
            TextForm(
              readOnly: true,
              labelText: 'Email',
              controller: emailController,
            ),
            TextForm(
              readOnly: true,
              labelText: 'Phone Number',
              controller: phoneNumberController,
            )
          ],
        ),
      ),
    );
  }
}
