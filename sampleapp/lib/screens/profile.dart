import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleapp/constants/export_constants.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key, required this.auth }) : super(key: key);
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
          alignment: Alignment.center,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: NetworkImage("https://images-na.ssl-images-amazon.com/images/I/31Cd9UQp6eL._SX355_.jpg"), fit: BoxFit.fill),
                ),
              ),
              Container(
                child: BoldText(
                  color: Colors.white,
                  text: " ${auth.currentUser!.displayName}",
                  size: 30,
                ),
              ),
              
            ],
          ),
        ),
        ],
    );
  }
}