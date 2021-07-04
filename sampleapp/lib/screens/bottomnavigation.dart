import 'package:flutter/material.dart';
import 'package:sampleapp/screens/courses.dart';
import 'package:sampleapp/screens/dashboard.dart';


class Nav extends StatefulWidget {
  @override
  _AllnavState createState() => _AllnavState();
}

class _AllnavState extends State<Nav> {
  final PageController controller = new PageController();
  int page = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: page,
          onTap: (value) {
            setState(() {
              page = value;
            });
            controller.animateToPage(page,
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Courses",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          Dashboard(),
          Courses(),
          Dashboard(),
        ],
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
      ),
    );
  }
}