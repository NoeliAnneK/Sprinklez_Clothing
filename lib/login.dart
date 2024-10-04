import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import secure storage
import 'package:mad_sprinklez_final/createAcc.dart'; // Ensure this import is correct
import 'package:mad_sprinklez_final/home.dart'; // Ensure this import is correct

class LoginScreen extends StatelessWidget {
  final VoidCallback switchTheme;

  // Update the constructor to accept switchTheme
  LoginScreen({required this.switchTheme});

  // Create an instance of FlutterSecureStorage
  final _storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth, // Ensuring the container takes full width
          color: Theme.of(context).backgroundColor, // Use the theme's background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: isLandscape ? 20 : 60),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'Assets/Images/Logo.png',
                    height: isLandscape ? 150 : 250,
                    width: isLandscape ? 150 : 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: isLandscape ? 20 : 40),
              Container(
                width: isLandscape ? screenWidth * 0.6 : screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username/ E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isLandscape ? 40 : 60),
              ElevatedButton(
                onPressed: () async {
                  // Simulate API response with a token (replace with actual login logic)
                  String token = 'sample_bearer_token_from_api'; // This would come from your API

                  // Save the token securely in storage
                  await _storage.write(key: 'bearer_token', value: token);

                  // Proceed to home page after storing the token
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: isLandscape ? 60 : 80, vertical: 15),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccScreen(isDarkMode: false)), // Use CreateAccScreen and pass the required argument
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: isLandscape ? 50 : 60, vertical: 15),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Theme switch button
              ElevatedButton(
                onPressed: switchTheme, // Call switchTheme on button press
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: isLandscape ? 50 : 60, vertical: 15),
                ),
                child: Text(
                  'Switch Theme',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: isLandscape ? 50 : 180),
            ],
          ),
        ),
      ),
    );
  }
}
