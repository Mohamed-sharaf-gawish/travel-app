import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/presentation/screens/travel_home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Change the status bar color to blue before the app is loaded
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green, // Set the color of the status bar
      statusBarIconBrightness: Brightness.light, // Change the icon color to light (you can use dark too)
    ));
    return MaterialApp(
      home: TravelHome(),
    );
  }
}
