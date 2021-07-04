import 'package:flutter/material.dart';
import 'package:sampleapp/screens/export_screens.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DashboardHolder extends StatefulWidget {
  const DashboardHolder({Key? key}) : super(key: key);

  @override
  _DashboardHolderState createState() => _DashboardHolderState();
}

class _DashboardHolderState extends State<DashboardHolder> {
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
          Dashboard(
            // controller: _controller,
            //auth: auth,
          ),
        ],
      )),
    );
  }
}