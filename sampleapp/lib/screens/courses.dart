import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampleapp/constants/texts.dart';

class Courses extends StatelessWidget {
  Courses({Key? key}) : super(key: key);
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);
  static Color yellow = Color(0xffFFFF66);
  final FirebaseFirestore allsubjects = FirebaseFirestore.instance;

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
                child: BoldText(
                  color: Colors.black,
                  text: "All Courses",
                  size: 40,
                ),
              ),
              Container(
                child: RegularText(
                  color: Colors.black,
                  text: "Find a course you want to learn",
                  size: 15,
                ),
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

                  return Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(image: NetworkImage(data["image"]),
                      fit: BoxFit.cover,
                      ),
                      
                    ),
                    child: BoldText(
                      text: data["name"],
                      size: 15,
                      color: Colors.black,
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
