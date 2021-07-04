import 'package:flutter/material.dart';
import 'package:sampleapp/constants/texts.dart';

class Courses extends StatelessWidget {
  const Courses({ Key? key }) : super(key: key);
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
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
                    child: BoldText(color: Colors.white,text:"Hi, Abhinav", size: 30,),
                  ),
                  Container(
                    child: RegularText(color: Colors.white,text:"Find a course you want to learn", size: 15,),
                  ),
                 
                ],
              ),
          ),
          
        ],
      ),
    );
  }
}