import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:purscliq_app/Login/login_provider.dart';
import 'package:purscliq_app/Homepage/homepage.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool switchValue = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login() async {
    var state = Provider.of<LoginProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) => SizedBox(
              height: 40,
              width: 40,
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  CircularProgressIndicator(
                      color: Theme.of(context).primaryColor)
                ],
                actionsAlignment: MainAxisAlignment.center,
              ),
            ));
    Response r;

    Map<String, String> body = {
      'email': emailController.text,
      'password': passwordController.text
    };
    r = await post(
      Uri.parse("https://api305.purscliq.com/api/login"),
      body: body,
    );
    print(json.decode(r.body)['data']['token']);
    String token = json.decode(r.body)['data']['token'];
    // json.decode(r.body)['data']['token'];
    state.getToken(token);

    if (r.statusCode == 200) {
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } else if (r.statusCode == 403 || r.statusCode == 404) {
      if (!mounted) return;
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              contentPadding: const EdgeInsets.only(top: 10.0),
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.red)),
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    Text(
                      "Incorrect Email or Password",
                      style: kAlertTitleTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Try Again',
                      style: kAlertContentTextStyle,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else if (r.statusCode == 302) {
      if (!mounted) return;
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              contentPadding: const EdgeInsets.only(top: 10.0),
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.red)),
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    Text(
                      "Empty Field(s)",
                      style: kAlertTitleTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Try Again',
                      style: kAlertContentTextStyle,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

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
                          // image: DecorationImage(
                          //     image: AssetImage('logo.jpg'))
                        )),
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
                      TextForm("User ID", 'Enter User ID', emailController,
                          false, SizedBox()),
                      TextForm('Password', 'Enter Password', passwordController,
                          true, SizedBox()),
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
                                    color: const Color.fromARGB(
                                        255, 49, 128, 231)),
                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {
                            login();
                          },
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
                          )),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have account yet?',
                            style: kBlue1TextStyle,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign Up",
                                style: kBlue1TextStyle.copyWith(
                                    color: const Color.fromARGB(
                                        255, 49, 128, 231)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
