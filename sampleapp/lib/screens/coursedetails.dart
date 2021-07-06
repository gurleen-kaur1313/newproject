import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampleapp/constants/export_constants.dart';

class Content extends StatefulWidget {
  Content({Key? key, required this.x}) : super(key: key);
  final String x;
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);
  static Color lightblue = Color(0xff483D8B);
  static Color pink = Color(0xffffb6c1);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final FirebaseFirestore allsubjects = FirebaseFirestore.instance;

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Content.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Content.lightblue),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                          RegularText(
                              text: "About course",
                              color: Colors.white,
                              size: 12)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Content.lightblue),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pending_actions,
                            size: 50,
                            color: Colors.white,
                          ),
                          RegularText(
                              text: "Practice tests",
                              color: Colors.white,
                              size: 12)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Content.lightblue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: BoldText(
                        color: Colors.white,
                        text: "Content",
                        size: 17,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 5, 5, 10),
                            width: 5,
                            color: Content.blue,
                          ),
                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                              stream:
                                  allsubjects.collection(widget.x).snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SpinKitDoubleBounce(
                                      color: Colors.black,
                                      size: 50.0,
                                    ),
                                  );
                                }

                                if (!snapshot.hasData) {
                                  return Center(
                                      child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BoldText(
                                          text: "No data Found!",
                                          color: Colors.black,
                                          size: 17),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.error,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ],
                                  ));
                                }
                                return Container(
                                  child: new ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data() as Map<String, dynamic>;
                                      return Container(
                                        height: 60,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  6, 10, 5, 10),
                                              padding: EdgeInsets.all(5),
                                              height: 45,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Content.grey,
                                              ),
                                              child: Icon(Icons.check,
                                                  color: Content.blue),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(13),
                                                decoration: BoxDecoration(
                                                  color: Content.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: RegularText(
                                                  size: 15,
                                                  text: ((i == 0)
                                                          ? "Chapter :"
                                                          : "Test :") +
                                                      "${data["chapter"]}",
                                                  color: Content.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}