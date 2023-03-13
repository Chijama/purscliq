import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ooops! Looks like you are not connected to the internet",
              style: kBlue1TextStyle.copyWith(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          
            TextButton(
                onPressed: () {
                  Phoenix.rebirth(context);
                },
                child: Text(
                  "Try Again",
                  style: kBlue1TextStyle.copyWith(
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }
}
