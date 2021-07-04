import 'package:flutter/material.dart';
import 'package:sampleapp/screens/export_screens.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginHolder extends StatefulWidget {
  const LoginHolder({Key? key}) : super(key: key);

  @override
  _LoginHolderState createState() => _LoginHolderState();
}

class _LoginHolderState extends State<LoginHolder> {
  final PageController _controller = new PageController();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Login(
            controller: _controller,
            //auth: auth,
          ),
          Register(
            controller: _controller,
            //auth: auth,
          ),
        ],
      )),
    );
  }
}