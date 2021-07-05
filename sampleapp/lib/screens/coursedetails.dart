import 'package:flutter/material.dart';
import 'package:sampleapp/constants/export_constants.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);
  static Color lightblue = Color(0xff483D8B);
  static Color pink = Color(0xffffb6c1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
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
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: lightblue),
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
                            text: "Math course", color: Colors.white, size: 12)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: lightblue),
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
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: lightblue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
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
                            color: blue,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(6, 10, 5, 10),
                                    padding: EdgeInsets.all(5),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey,
                                    ),
                                    child: Icon(Icons.check, color: blue),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: RegularText(
                                        size: 15,
                                        text: "Chapter 1: Number system",
                                        color: grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(6, 10, 5, 10),
                                    padding: EdgeInsets.all(5),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey,
                                    ),
                                    child: Icon(Icons.check, color: blue),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: RegularText(
                                        size: 15,
                                        text: "Chapter 1: Number system",
                                        color: grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(6, 10, 5, 10),
                                    padding: EdgeInsets.all(5),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey,
                                    ),
                                    child: Icon(Icons.check, color: blue),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: RegularText(
                                        size: 15,
                                        text: "Chapter 1: Number system",
                                        color: grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(6, 10, 5, 10),
                                    padding: EdgeInsets.all(5),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey,
                                    ),
                                    child: Icon(Icons.check, color: blue),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: RegularText(
                                        size: 15,
                                        text: "Chapter 1: Number system",
                                        color: grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          
                            ],
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