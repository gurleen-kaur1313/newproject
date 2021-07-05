import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleapp/screens/export_screens.dart';

class CurrentPage extends GetxController {
  RxInt page = 0.obs;
}

class DashboardHolder extends StatefulWidget {
  const DashboardHolder({Key? key, required this.auth}) : super(key: key);
  final FirebaseAuth auth;

  @override
  _DashboardHolderState createState() => _DashboardHolderState();
}

class _DashboardHolderState extends State<DashboardHolder> {
  final PageController controller = new PageController();
  final CurrentPage obj = Get.put(CurrentPage());
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: obj.page.value,
          onTap: (value) {
            obj.page.value = value;
            controller.animateToPage(obj.page.value,
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: PageView(
        onPageChanged: (value) {
          obj.page.value = value;
        },
        controller: controller,
        children: [
          Dashboard(auth: widget.auth,
              //   // controller: _controller,
              ),
          Courses(),
          Profile(auth: widget.auth,),
        ],
      )),
    );
  }
}