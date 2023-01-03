import 'dart:async';
import 'package:flutter/material.dart';

class spl extends StatefulWidget {
  const spl({Key? key}) : super(key: key);

  @override
  State<spl> createState() => _splState();
}

class _splState extends State<spl> {
  changeScreen() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed('Myapp');
    });
  }

  @override
  void initState() {
    super.initState();

    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/phone.png")),
            const Text(
              "CONTACTS",
              style: TextStyle(
                  color: Colors.black, fontSize: 30, letterSpacing: 2),
            ),
            const CircularProgressIndicator(color: Colors.black),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF1EEE9),
    );
  }
}
