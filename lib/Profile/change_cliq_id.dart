import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/widget/button.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';
import 'package:purscliq_app/shared/widget/textform.dart';

class ChangeCliqID extends StatefulWidget {
  const ChangeCliqID({super.key});

  @override
  State<ChangeCliqID> createState() => _ChangeCliqIDState();
}

class _ChangeCliqIDState extends State<ChangeCliqID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change Cliq ID',automaticallyImplyLeading: true,),
      body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(children: [
              const TextForm(readOnly: false,labelText: 'Enter a new cliq ID',),
              CustomButton(label: 'Submit', onPressed: (){})
            ],),
      ),
    );
  }
}