import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:purscliq_app/Homepage/homepage.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/textfield.dart';

class LoginReturning extends StatefulWidget {
  const LoginReturning({super.key});

  @override
  State<LoginReturning> createState() => _LoginReturningState();
}

class _LoginReturningState extends State<LoginReturning> {
  String email = "peteradeojo@outlook.com";
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future login() async {
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
      'email': email,
      'password': passwordController.text
    };
    r = await post(
      Uri.parse("https://api305.purscliq.com/api/login"),
      body: body,
    );
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
                      "Incorrect Password",
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
          children: <Widget>[
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
                        // image:
                        //     DecorationImage(
                        //       image: AssetImage('logo.jpg')
                        //       )
                      )),
                  const SizedBox(height: 80),
                  Text(
                    'Welcome Back',
                    style: kBlack3TextStyle.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Peter',
                    style: kBlack1TextStyle.copyWith(
                        color: const Color.fromARGB(255, 49, 128, 231)),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    email,
                    style: kBlack2TextStyle,
                  ),
                  const SizedBox(height: 20),
                  TextForm(
                      text: 'Password',
                      hintText: 'Enter Password',
                      controller: passwordController,
                      obscureText: _passwordVisible,
                      suffixWidget: InkWell(
                        onTap: () {
                          setState(() {
                            if (_passwordVisible == false) {
                              _passwordVisible = true;
                            } else {
                              _passwordVisible = false;
                            }

                            //_passwordVisible = !_passwordVisible;
                          });
                        },
                        child: _passwordVisible == false
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: kBlue1TextStyle.copyWith(
                                color: const Color.fromARGB(255, 49, 128, 231)),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.70,
                                  50)),
                          child: Text(
                            'Login',
                            style: kBlack2TextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.18,
                                  50)),
                          child: const Icon(
                            Icons.fingerprint_rounded,
                            color: Colors.white,
                            size: 23,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not Peter?',
                        style: kBlue1TextStyle,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Switch Account",
                            style: kBlue1TextStyle.copyWith(
                                color: const Color.fromARGB(255, 49, 128, 231)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
