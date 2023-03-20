import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:purscliq_app/Login/login.dart';
import 'package:purscliq_app/SplashScreen/none.dart';
import 'package:purscliq_app/returning.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source ${_source}');

      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = "mobile";
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())));
          break;
        case ConnectivityResult.wifi:
          string = "wifi";
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())));
          break;
        case ConnectivityResult.none:

        default:
          string = "none";
          Timer(
              const Duration(seconds: 5),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const NoInternet())));
          setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Visibility(
          child: const InternetNotAvailable(), visible: string == "none"),
      Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash_screen.png"),
                    fit: BoxFit.cover),
              )))
    ]));
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      log('$result');
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: const Center(
        child: Text(
          'No Internet Connection!!!',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
