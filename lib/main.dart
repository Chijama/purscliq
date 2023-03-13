import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:purscliq_app/Login/login.dart';
import 'package:purscliq_app/Login/login_provider.dart';
import 'package:purscliq_app/SplashScreen/none.dart';
import 'package:purscliq_app/airtime.dart';
import 'package:purscliq_app/send_money.dart';
import 'package:purscliq_app/SplashScreen/splash.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      )
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
    return
        // StreamProvider<InternetConnectionStatus>(
        //     initialData: InternetConnectionStatus.connected,
        //     create: (_) {
        //       return InternetConnectionChecker().onStatusChange;
        //     },
        //     child: MaterialApp(
        //       title: 'Flutter Demo',
        //       home: SplashScreen(),
        //     ));
        MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // home: const LoginPage(),
      //home: const ConnectionCheckerDemo(),
    );
  }
}
