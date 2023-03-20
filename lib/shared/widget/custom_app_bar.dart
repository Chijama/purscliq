import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.action,
    required this.automaticallyImplyLeading,
  
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String title;
  final List<Widget>? action;
  final bool automaticallyImplyLeading;

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColor.black),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      centerTitle: true,
       leading: widget.automaticallyImplyLeading ?  IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.blue,
            ),
            onPressed: () => Navigator.pop(context),
          ): null,
      elevation: 0,
      title: Text(
        widget.title.toUpperCase(),
        style: kAppbarTextStyle,
      ),
      actions: widget.action,
    );
  }
}
