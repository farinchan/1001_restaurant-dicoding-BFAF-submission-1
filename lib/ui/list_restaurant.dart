// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/home_page.dart';

class ListRestaurant extends StatefulWidget {
  const ListRestaurant({Key? key}) : super(key: key);

  @override
  State<ListRestaurant> createState() => _ListRestaurantState();
}

class _ListRestaurantState extends State<ListRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColor,
      appBar: AppBar(
        backgroundColor: HomeColor,
        elevation: 0,
        title: Text("1001 Restaurant"),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  indexBottomNav = 2;
                });
              }),
          IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  indexBottomNav = 1;
                });
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70),
            height: 600,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/restaurant.json"),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  //loading widget
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  // error widget
                  return Text('fail get data');
                }
                final List<RestaurantElement> resto =
                    restaurantFromJson(snapshot.data.toString()).restaurants;
                return ListView.builder(
                    itemCount: resto.length,
                    itemBuilder: (context, index) {
                      return _buildRestoItem(resto[index], context);
                    });
              }),
        ],
      ),
    );
  }

  Widget _buildRestoItem(RestaurantElement resto, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2, 1),
              blurRadius: 10,
            ),
          ]),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  resto.pictureId,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resto.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.share_location,
                              color: Colors.redAccent[100],
                              size: 20,
                            ),
                            Text(resto.city),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Text(resto.rating.toString())
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              bottom: 3,
              right: 20,
              child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(color: HomeColor),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, "/detail_screen",
                        arguments: resto);
                  },
                  child: Text(
                    "view",
                    style: TextStyle(color: HomeColor),
                  )))
        ],
      ),
    );
  }
}
