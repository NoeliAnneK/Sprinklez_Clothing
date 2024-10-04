import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_sprinklez_final/myOrders.dart';
import 'package:mad_sprinklez_final/profile.dart';
import 'package:mad_sprinklez_final/CasualWear.dart';
import 'package:mad_sprinklez_final/home.dart';
import 'package:mad_sprinklez_final/cart.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 3; // Set default to Profile tab
  final List<Widget> _pages = [
    HomePage(),
    MyOrdersPage(),
    ShoppingCartPage(),
    Profile(),
  ];

  File? _profileImage; // To store the selected profile image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // Update state with selected image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLandscape = screenSize.width > screenSize.height;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: isLandscape
                ? EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0)
                : EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: isLandscape ? 20 : 50),
                GestureDetector(
                  onTap: _pickImage, // Open gallery to pick image
                  child: CircleAvatar(
                    radius: isLandscape ? 40 : 60,
                    backgroundColor: Colors.pink[200],
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('Assets/Images/3.jpeg') as ImageProvider,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Sunny Jane \nSunny@gmail.com\n1234567890',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isLandscape ? 24 : 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                SizedBox(height: isLandscape ? 10 : 20),
                ProfileButton(label: 'Account Settings', isLandscape: isLandscape),
                ProfileButton(label: 'Customer Support', isLandscape: isLandscape),
                ProfileButton(label: 'Ongoing Orders', isLandscape: isLandscape),
                ProfileButton(label: 'Order History', isLandscape: isLandscape),
                SizedBox(height: isLandscape ? 20 : 50),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pink[100],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String label;
  final bool isLandscape;

  ProfileButton({required this.label, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isLandscape ? 5.0 : 10.0,
        horizontal: isLandscape ? 20.0 : 40.0,
      ),
      child: Container(
        width: isLandscape ? 300.0 : double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink[300],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: Size(double.infinity, isLandscape ? 40 : 50),
          ),
          onPressed: () {},
          child: Text(
            label,
            style: TextStyle(fontSize: isLandscape ? 14 : 16),
          ),
        ),
      ),
    );
  }
}
