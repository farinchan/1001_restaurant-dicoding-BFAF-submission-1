// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BookmarkColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark),
            SizedBox(width: 10),
            Text("Bookmark")
          ],
        ),
        elevation: 0,
        backgroundColor: BookmarkColor,
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
            child: Text(
                "kamu belum menambahkan restaurant kedalam daftar bookmark",
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
