import 'package:flutter/material.dart';
import 'package:sampleapp/constants/texts.dart';

class Subject extends StatelessWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: 45,
            width: 200,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg") //NetworkImage
                        ),
                    //DecorationImage
                  ), //BoxDecoration
                  child: Text(
                    "Maths",
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ), //Text
                ),
              ],
            ),
          ),
          Container(
            child: RegularText(
              color: Colors.black,
              size: 15,
              text: "Math for 6th",
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
  }
}