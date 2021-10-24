// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  RestaurantElement resto;
  DetailScreen({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    resto.pictureId,
                    fit: BoxFit.fitWidth,
                  ),
                  title: Text(resto.name,
                      style: TextStyle(shadows: [
                        BoxShadow(
                            color: HomeColor,
                            offset: Offset(2, 2),
                            blurRadius: 5),
                      ])),
                ),
                backgroundColor: HomeColor,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: BookmarkButton()),
                    Container(
                      decoration: BoxDecoration(
                          color: HomeColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 + 80,
                      padding: EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.share_location,
                                color: Colors.white,
                              ),
                              SizedBox(height: 2),
                              Text(
                                resto.city,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              SizedBox(height: 2),
                              Text(
                                resto.rating.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    resto.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  "Daftar Menu",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Makanan :",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: resto.menus.foods
                              .map((food) => Text(
                                    food.name,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minuman :",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: resto.menus.drinks
                              .map((drinks) => Text(
                                    drinks.name,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(bottom: 40, top: 20),
                  child: Column(
                    children: [
                      Text(
                        "Beri Rating Restaurant Ini",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Rating((rating) {})
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

///BOOKMARK BUTTON
class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFavorite ? Icons.bookmark : Icons.bookmark_add_outlined,
          color: HomeColor,
          size: 40,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}

//RATING BAR
class Rating extends StatefulWidget {
  final int maxRating;
  final Function(int) onRatingSelected;
  Rating(this.onRatingSelected, [this.maxRating = 5]);
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        Icons.star,
        color: Colors.orange,
        size: 40,
      );
    } else {
      return Icon(
        Icons.star_outline,
        size: 30,
      );
    }
  }

  Widget _buildBody() {
    final stars = List.generate(this.widget.maxRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
