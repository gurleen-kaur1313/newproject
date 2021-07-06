import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sampleapp/constants/texts.dart';
import 'package:sampleapp/screens/export_screens.dart';

class Courses extends StatelessWidget {
  Courses({Key? key, required this.auth}) : super(key: key);
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);
  static Color yellow = Color(0xffFFFF66);
  final FirebaseFirestore allsubjects = FirebaseFirestore.instance;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //     color: blue,
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(25),
          //         bottomRight: Radius.circular(25))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: WeightText(
                  weight: FontWeight.bold,
                  color: Colors.black,
                  text: "All Courses",
                  size: 40,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: RegularText(
                      color: Colors.black,
                      text: "Find a course you want to learn",
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: allsubjects.collection('allSubjects').snapshots(),
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
              child: new GridView.count(
                crossAxisCount: 2,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () {
                      allsubjects
                          .collection(auth.currentUser!.uid.toString())
                          .doc(data["name"])
                          .set({
                        "subjectName": data["name"],
                        "subjectImage": data["image"],
                        "subjectChapters": data["chapters"],
                        "subjectLectures": data["lectures"],
                      });
                      
                      Get.to(Content(x: data["name"],));
                    
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.all(15),
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(offset: Offset(0, 2), blurRadius: 10)
                        ],
                        image: DecorationImage(
                          image: NetworkImage(data["image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                        child: BoldText(
                          text: data["name"].toString().toUpperCase(),
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        )
      ],
    );
  }
}