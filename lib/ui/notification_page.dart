// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotificationColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications),
            SizedBox(width: 10),
            Text("Notification"),
          ],
        ),
        elevation: 0,
        backgroundColor: NotificationColor,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        height: 600,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Text("Kamu tidak memiliki notifikasi",
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
