import 'dart:async';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sampleapp/constants/export_constants.dart';
import 'package:sampleapp/models/export_models.dart';
import 'package:sampleapp/screens/export_screens.dart';

class Register extends StatefulWidget {
  final PageController controller;
  //final FirebaseAuth auth;
  const Register({Key? key, required this.controller, })
      : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";

  final TextEditingController emailController = new TextEditingController();

  String name = "";
  final TextEditingController nameController = new TextEditingController();

  String password = "";
  final TextEditingController passwordController = new TextEditingController();

  final RegisterButton button = Get.put(RegisterButton());
  final RegisterFieldError fileds = Get.put(RegisterFieldError());

  @override
  void initState() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
    nameController.addListener(() {
      name = nameController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Widget regChild() {
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
                "Email in Use",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 4:
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
                "Weak Password!",
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

  bool buttonDisable = false;

  Future<int> signUp() async {
    /*
  Button codes
  1 -> is loading
  0 -> default
  2 -> success
  3 -> email in use
  4 -> weak password 
  */
    buttonDisable = true;
    button.button.value = 1;
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      fileds.emailError.value = true;
      fileds.nameError.value = true;
      fileds.passwordError.value = true;
      Timer(Duration(seconds: 2), () {
        setState(() {
          fileds.emailError.value = false;
          fileds.passwordError.value = false;
          fileds.nameError.value = true;
        });
      });
      return 0;
    } 
    // else {
    //   try {
    //     await widget.auth
    //         .createUserWithEmailAndPassword(email: email, password: password);
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'weak-password') {
    //       print('The password provided is too weak.');
    //       return 4;
    //     } else if (e.code == 'email-already-in-use') {
    //       print('The account already exists for that email.');
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
            child: Image.asset(
              "lib/assets/register.gif",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const BoldText(
            text: "WhatsUp?",
            size: 37,
            color: Colors.black,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: const RegularText(
            text: "Create a account to get started.",
            size: 28,
            color: Colors.black,
          ),
        ),
        Obx(
          () => Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
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
              controller: nameController,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                errorText: (fileds.nameError.value) ? "Can't be empty!" : null,
                labelText: "Name",
                prefixIcon: Icon(Icons.people),
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
                  primary: Colors.amber[600],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onPressed: () async {
                  button.button.value = (buttonDisable) ? 5 : await signUp();
                  // if (button.button.value == 2) {
                  //   await widget.auth.currentUser!.updateDisplayName(name);
                  //   await getLocation();
                  //   Get.offAll(() => Dashboard(auth: widget.auth));
                  // }
                  Timer(Duration(milliseconds: 1500), () async {
                    buttonDisable = false;
                    button.button.value = 0;
                  });
                },
                child: regChild()),
          ),
        ),
        SizedBox(height: 40),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RegularText(
                    text: "Already having Account?",
                    color: Colors.black,
                    size: 15),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    widget.controller.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: const BoldText(
                      text: "SignIn", color: Colors.black, size: 15),
                ),
              ],
            )),
      ],
    );
  }
}
