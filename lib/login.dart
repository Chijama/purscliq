import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 80,
                        width: 74,
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage('logo.jpg')))),
                    const SizedBox(height: 60),
                    Text(
                      'Welcome',
                      style: kBlack1TextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      'Login',
                      style: kBlack2TextStyle,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 24, 25),
                  child: Column(
                    children: [
                      TextForm("User ID", 'Enter User ID'),
                      TextForm('Password', 'Enter Password'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: kBlue1TextStyle,
                            )
                          ]),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: kBlue1TextStyle.copyWith(
                                    color: const Color.fromARGB(255, 49, 128, 231)),
                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50)),
                          child: Text(
                            'Login',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16),
                          ))
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
