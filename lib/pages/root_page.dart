import 'package:banking_ui/pages/dashboard_page.dart';
import 'package:banking_ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banking UI"),
        backgroundColor: primary,
        //bottomOpacity: getTasks(),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: getTasks(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = 4;
          });
        },
        child: Icon(AntDesign.creditcard, size: 25),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getTabs(),
    );
  }

  Widget getTasks() {
    List<IconData> iconsItem = [
      MaterialCommunityIcons.view_grid,
      MaterialCommunityIcons.comment,
      MaterialCommunityIcons.bell,
      MaterialCommunityIcons.account_circle
    ];
    return AnimatedBottomNavigationBar(
      icons: iconsItem,
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      activeIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
    );
  }

  Widget getTabs() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DashboardPage(),
        Center(
          child: Text(
            "Chat Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Notification Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Account Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Credit Card Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
