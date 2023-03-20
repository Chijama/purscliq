import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purscliq_app/Homepage/homepage_provider.dart';
import 'package:purscliq_app/Login/login.dart';
//import 'package:device_preview/device_preview.dart';

import 'package:purscliq_app/Login/login_provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        
      ),
      ChangeNotifierProvider(
        create: (_) => HomepageProvider(),
        
      ),
    ],
    child: Phoenix(child: const MyApp()),
  )
      // DevicePreview
      // (
      // enabled: false,
      // builder: (context) =>
      //)
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ChangePin(),
       home: const LoginPage(),
    );
  }
}
