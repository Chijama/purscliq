import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/widget/textform.dart';
import 'shared/widget/custom_app_bar.dart';
import 'package:purscliq_app/Homepage/homepage_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/services.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final TextEditingController bankNameController = TextEditingController();

  final TextEditingController accNameController = TextEditingController();

  final TextEditingController accNumController = TextEditingController();

  final TextEditingController cliqIDController = TextEditingController();

  @override
  void initState() {
    var accInfoState = Provider.of<HomepageProvider>(context, listen: false);
    bankNameController.text = accInfoState.bankName!;
    accNameController.text = accInfoState.accName!;
    accNumController.text = accInfoState.accNumber!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Account Information",
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            children: [
              TextForm(
                controller: bankNameController,
                readOnly: true,
                labelText: "Bank Name",
                suffixWidget: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: bankNameController.text))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Copied to your clipboard'),
                        backgroundColor: Colors.black54,
                      ));
                    });
                  },
                  icon: const Icon(Icons.file_copy_outlined),
                ),
              ),
              TextForm(
                controller: accNameController,
                readOnly: true,
                labelText: "Account Name",
                suffixWidget: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: accNameController.text))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Copied to your clipboard'),
                        backgroundColor: Colors.black54,
                      ));
                    });
                  },
                  icon: const Icon(Icons.file_copy_outlined),
                ),
              ),
              TextForm(
                controller: accNumController,
                readOnly: true,
                labelText: "Account Number",
                suffixWidget: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: accNumController.text))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Copied to your clipboard'),
                        backgroundColor: Colors.black54,
                      ));
                    });
                  },
                  icon: const Icon(Icons.file_copy_outlined),
                ),
              ),
              TextForm(
                controller: cliqIDController,
                readOnly: true,
                labelText: "Cliq ID",
                suffixWidget: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: cliqIDController.text))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Copied to your clipboard'),
                        backgroundColor: Colors.black54,
                      ));
                    });
                  },
                  icon: const Icon(Icons.file_copy_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
