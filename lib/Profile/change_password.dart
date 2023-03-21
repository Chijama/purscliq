import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/widget/button.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';
import 'package:purscliq_app/shared/widget/textform.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          automaticallyImplyLeading: true,
          title: 'Change Password',
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextForm(
                  controller: oldPasswordController,
                  validator: (password) {
                    if (password!.isEmpty || RegExp(r'(\s)').hasMatch(password)) {
                      return "Please enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  readOnly: false,
                  obscureText: _oldPasswordVisible,
                  labelText: 'Old Password',
                  suffixWidget: InkWell(
                    onTap: () {
                      setState(() {
                        if (_oldPasswordVisible == false) {
                          _oldPasswordVisible = true;
                        } else {
                          _oldPasswordVisible = false;
                        }
                      });
                    },
                    child: _oldPasswordVisible == false
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            size: 20,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            size: 20,
                          ),
                  ),
                ),
                TextForm(
                  controller: newPasswordController,
                  validator: (password) {
                    if (password!.isEmpty || RegExp(r'(\s)').hasMatch(password)) {
                      return "Please enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  readOnly: false,
                  obscureText: _newPasswordVisible,
                  labelText: 'New Password',
                  suffixWidget: InkWell(
                    onTap: () {
                      setState(() {
                        if (_newPasswordVisible == false) {
                          _newPasswordVisible = true;
                        } else {
                          _newPasswordVisible = false;
                        }
                      });
                    },
                    child: _newPasswordVisible == false
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            size: 20,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            size: 20,
                          ),
                  ),
                ),
                TextForm(
                  controller: confirmPasswordController,
                  validator: (password) {
                    if (confirmPasswordController.text !=
                        newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    if (password!.isEmpty || RegExp(r'(\s)').hasMatch(password)) {
                      return "Please enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  readOnly: false,
                  obscureText: _confirmPasswordVisible,
                  labelText: 'Confirm New Password',
                  suffixWidget: InkWell(
                    onTap: () {
                      setState(() {
                        if (_confirmPasswordVisible == false) {
                          _confirmPasswordVisible = true;
                        } else {
                          _confirmPasswordVisible = false;
                        }
                      });
                    },
                    child: _confirmPasswordVisible == false
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            size: 20,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            size: 20,
                          ),
                  ),
                ),
                CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    final form = formKey.currentState;
                    if (form!.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
