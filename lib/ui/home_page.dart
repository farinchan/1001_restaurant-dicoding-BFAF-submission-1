// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/ui/bookmark_page.dart';
import 'package:restaurant_app/ui/list_restaurant.dart';
import 'package:restaurant_app/ui/notification_page.dart';
import 'package:restaurant_app/ui/settings_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

int indexBottomNav = 0;
List<Widget> widgetOptions = [
  ListRestaurant(),
  BookmarkPage(),
  NotificationPage(),
  SettingPage(),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(indexBottomNav),
      bottomNavigationBar: SalomonBottomBar(
          onTap: (index) {
            setState(() {
              indexBottomNav = index;
            });
          },
          currentIndex: indexBottomNav,
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: HomeColor),
            SalomonBottomBarItem(
                icon: Icon(Icons.bookmark),
                title: Text("Bookmark"),
                selectedColor: BookmarkColor),
            SalomonBottomBarItem(
                icon: Icon(Icons.notifications),
                title: Text("Notification"),
                selectedColor: NotificationColor),
            SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Setting"),
                selectedColor: settingColor),
          ]),
    );
  }
}
