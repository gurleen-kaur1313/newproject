import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampleapp/constants/subject.dart';
import 'package:sampleapp/constants/texts.dart';
import 'package:sampleapp/constants/quotes.dart';
import 'dart:math';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key, required this.auth}) : super(key: key);
  final FirebaseAuth auth;
  final FirebaseFirestore allsubjects = FirebaseFirestore.instance;
  
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);

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
              color: blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: BoldText(
                  color: Colors.white,
                  text: "Hello, ${auth.currentUser!.displayName}",
                  size: 30,
                ),
              ),
              Container(
                child: RegularText(
                  color: Colors.white,
                  text: "What would you like to learn today?",
                  size: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: RegularText(
                  color: grey,
                  text: list[Random().nextInt(list.length)],
                  size: 15,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: RegularText(
            color: red,
            text: "Pick up where you left..",
            size: 15,
          ),
        ),
             StreamBuilder<QuerySnapshot>(
          stream: allsubjects.collection(
            "${auth.currentUser!.uid}"
          ).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Expanded(
                  child: Center(
                child: SpinKitDoubleBounce(
                  color: Colors.black,
                  size: 50.0,
                ),
              ));
            }

            if (!snapshot.hasData) {
              return Expanded(
                  child: Center(
                      child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoldText(
                      text: "No data Found!", color: Colors.black, size: 17),
                  SizedBox(width: 8),
                  Icon(
                    Icons.error,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              )));
            }

            return Expanded(
              child: new ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  //  return  Container(
                  //     height: 150,
                  //     width: 150,
                  //     margin: EdgeInsets.all(10),
                  //     padding: EdgeInsets.all(20),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(25),
                  //       image: DecorationImage(image: NetworkImage(data["subjectImage"]),
                  //       fit: BoxFit.cover,
                  //       ),
                        
                  //     ),
                  //     child: BoldText(
                  //       text: data["subjectName"],
                  //       size: 15,
                  //       color: Colors.black,
                  //     ),
                  //   );
                  return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              height: 45,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              data["subjectImage"]) //NetworkImage
                          ),
                      //DecorationImage
                    ), //BoxDecoration
                    child: BoldText(text:
                      data["subjectName"],
                      color: Colors.black, size: 15.0),//Text
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: RegularText(
              color: Colors.black,
              size: 15,
              text: data["subjectName"],
            ),
          ),
          Container(
            child: BoldText(
              color: Colors.black,
              size: 15,
              text: "Introduction to Fractions",
            ),
          ),
          Container(
            child: RegularText(
              color: Colors.black,
              size: 15,
              text:
                  "This is chapter 3/18. In this chapter we will learn in depth about types of fractions",
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text("1/32"),
              // Text("Read more"),
              Container(
                child: RegularText(
                  color: Colors.blue,
                  size: 15,
                  text: "1/32",
                ),
              ),
              Container(
                child: RegularText(
                  color: Colors.blue,
                  size: 15,
                  text: "Read more",
                ),
              ),
            ],
          ),
        ],
      ),
    );
                 
                }).toList(),
              ),
            );
          },
        ),
       
        // Nav(),
      ],
    );
  }
}
