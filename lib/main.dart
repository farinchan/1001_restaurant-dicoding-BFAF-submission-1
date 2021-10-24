import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_screen.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "restaurant app ",
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      initialRoute: "/splashscreen",
      routes: {
        "/splashscreen": (context) => SplashscreenView(),
        "/home_page": (context) => HomePage(),
        "/detail_screen": (context) => DetailScreen(
              resto: ModalRoute.of(context)!.settings.arguments
                  as RestaurantElement,
            )
      },
    );
  }
}
