import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/login.dart';
import 'package:mad_sprinklez_final/home.dart'; // Import the Home Page
import 'package:mad_sprinklez_final/createAcc.dart'; // Import the Create Account Page
import 'package:mad_sprinklez_final/CasualWear.dart';
import 'package:mad_sprinklez_final/itemdetails.dart';
import 'package:mad_sprinklez_final/myOrders.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Toggle for light/dark mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sprinklez',
      theme: ThemeData(
        brightness: Brightness.light, // Light theme
        primaryColor: Colors.pink[100],
        backgroundColor: Colors.pink[100],
        bottomAppBarColor: Colors.pink[100],
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        primaryColor: Color(0xFF921A40), // Background color
        backgroundColor: Color(0xFF921A40), // Main background color
        bottomAppBarColor: Color(0xFF921A40), // Bottom app bar color
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.grey[300]), // Text color
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFC75B7A), // Text field background color
          hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none, // No border
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFD9ABAB), // Button color
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Toggle between themes
      home: LoginScreen(
        switchTheme: () {
          setState(() {
            isDarkMode = !isDarkMode; // Toggle dark mode on/off
          });
        },
      ),
    );
  }
}
