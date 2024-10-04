import 'package:flutter/material.dart';

class CreateAccScreen extends StatelessWidget {
  final bool isDarkMode;

  CreateAccScreen({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textFieldWidth =
    orientation == Orientation.portrait ? screenWidth * 0.8 : screenWidth * 0.7;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth, // Full screen width
            color: Colors.pink[100], // Background color for the page
            padding: EdgeInsets.symmetric(vertical: 20), // Add padding to handle landscape
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Handling different heights for portrait and landscape
                SizedBox(height: orientation == Orientation.portrait ? 50 : 20),
                ClipOval(
                  child: Image.asset(
                    'Assets/Images/Logo.png',
                    height: orientation == Orientation.portrait ? 160 : 100,
                    width: orientation == Orientation.portrait ? 110 : 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: orientation == Orientation.portrait ? 20 : 10),
                Container(
                  width: textFieldWidth,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: orientation == Orientation.portrait ? 10 : 5),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: orientation == Orientation.portrait ? 10 : 5),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contact Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: orientation == Orientation.portrait ? 10 : 5),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: orientation == Orientation.portrait ? 10 : 5),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password with 8 Characters',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: orientation == Orientation.portrait ? 40 : 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: orientation == Orientation.portrait ? 50 : 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
