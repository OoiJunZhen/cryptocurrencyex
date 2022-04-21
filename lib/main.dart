import 'dart:async';
import 'package:flutter/material.dart';
import 'currencyEx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material  App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage());
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const currencyExPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cryptocurrencyX.jpg', scale: 2),
          const Text(
            "CryptoCurrencyEx",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 100),
          const CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
