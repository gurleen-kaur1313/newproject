import 'dart:async';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sampleapp/constants/export_constants.dart';
import 'package:sampleapp/models/export_models.dart';
import 'package:sampleapp/screens/export_screens.dart';

class Login extends StatefulWidget {
  final PageController controller;
  //final FirebaseAuth auth;
  const Login({Key? key, required this.controller,})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  final TextEditingController emailController = new TextEditingController();

  String password = "";
  final TextEditingController passwordController = new TextEditingController();

  bool buttonDisable = false;

  final LoginButton button = Get.put(LoginButton());
  final LoginFieldError fileds = Get.put(LoginFieldError());

  @override
  void initState() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Widget logChild() {
    /*
  Button codes
  1 -> is loading
  0 -> default
  2 -> success
  3 -> error
  */

    switch (button.button.value) {
      case 0:
        {
          return Container(
            child: BoldText(text: "Continue", color: Colors.white, size: 20),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Success!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Check Credentials",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      default:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
    }
  }

  Future<int> signIn() async {
    /*
  Button codes
  1 -> is loading
  0 -> default
  2 -> success
  3 -> error
  */
    buttonDisable = true;
    button.button.value = 1;
    if (email.isEmpty || password.isEmpty) {
      fileds.emailError.value = true;
      fileds.passwordError.value = true;
      Timer(Duration(seconds: 2), () {
        setState(() {
          fileds.emailError.value = false;
          fileds.passwordError.value = false;
        });
      });
      return 0;
    } 
    // else {
    //   try {
    //     await widget.auth
    //         .signInWithEmailAndPassword(email: email, password: password);
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'user-not-found') {
    //       print('No user found for that email.');
    //       return 3;
    //     } else if (e.code == 'wrong-password') {
    //       print('Wrong password provided for that user.');
    //       return 3;
    //     }
    //   }
    // }

     return 2;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 200,
            child: Image.asset("lib/assets/bookstack.gif"),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const BoldText(
            text: "Let's sign you in.",
            size: 37,
            color: Colors.black,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: const RegularText(
            text: "Welcome back.\nYou've been missed alot.",
            size: 28,
            color: Colors.black,
          ),
        ),
        Obx(
          () => Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                errorText: (fileds.emailError.value) ? "Can't be empty!" : null,
                labelText: "Email",
                prefixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "*",
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                errorText:
                     (fileds.passwordError.value) ? "Can't be empty!" : null,
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.amber,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onPressed: () async {
                  button.button.value = (buttonDisable) ? 5 : await signIn();
                  // if (button.button.value == 2) {
                  //   await getLocation();
                  //   Get.offAll(() => Dashboard(auth: widget.auth));
                  // }
                  Timer(Duration(milliseconds: 1500), () {
                    buttonDisable = false;
                    button.button.value = 0;
                  });
                },
                child: logChild()),
          ),
        ),
        SizedBox(height: 50),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RegularText(
                    text: "Not having Account?", color: Colors.black, size: 15),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    widget.controller.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: const BoldText(
                      text: "SignUp", color: Colors.black, size: 15),
                ),
              ],
            )),
      ],
    );
  }
}
