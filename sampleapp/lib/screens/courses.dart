import 'package:flutter/material.dart';
import 'package:sampleapp/constants/texts.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  static Color red = Color(0xffce1d3f);
  static Color blue = Color(0xff222b56);
  static Color grey = Color(0xffc7cade);
  static Color yellow = Color(0xffFFFF66);

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
                  text: "Hi, Abhinav",
                  size: 30,
                ),
              ),
              Container(
                child: RegularText(
                  color: Colors.white,
                  text: "Find a course you want to learn",
                  size: 15,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                height: 70,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BoldText(
                        text: "General Knowledge",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: RegularText(
                        text: "16 chapters",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: BoldText(
                        text: "120 lessons",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BoldText(
                        text: "General Knowledge",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: RegularText(
                        text: "16 chapters",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: BoldText(
                        text: "120 lessons",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BoldText(
                        text: "General Knowledge",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: RegularText(
                        text: "16 chapters",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: BoldText(
                        text: "120 lessons",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BoldText(
                        text: "General Knowledge",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: RegularText(
                        text: "16 chapters",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: BoldText(
                        text: "120 lessons",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BoldText(
                        text: "General Knowledge",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: RegularText(
                        text: "16 chapters",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: BoldText(
                        text: "120 lessons",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 30,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BoldText(
                        text: "General Knowledge",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: RegularText(
                        text: "16 chapters",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: BoldText(
                        text: "120 lessons",
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}