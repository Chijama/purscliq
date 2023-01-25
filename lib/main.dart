import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:purscliq_app/homepage.dart';

void main() {
  runApp(
    // DevicePreview
    // (
    // enabled: false,
    // builder: (context) =>
    const MyApp(),
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
