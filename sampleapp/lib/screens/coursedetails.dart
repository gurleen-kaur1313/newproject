import 'package:flutter/material.dart';
import 'package:sampleapp/constants/export_constants.dart';


class Content extends StatelessWidget {
  const Content({ Key? key }) : super(key: key);
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                height: 150,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: blue),
                child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_rounded,
                            size: 50,
                            color: grey,
                          ),
                          RegularText(
                              text: "Math course",
                              color: Colors.white,
                              size: 12)
                        ],
                      ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                height: 150,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: blue),
                child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pending_actions,
                            size: 50,
                            color: grey,
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
          Container(
            margin: EdgeInsets.all(20),
            height: 400,
            width: 275,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 50, 10, 10),
                  height: 300,
                  width: 5,
                  color: grey,
                ),
                Column(

                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}