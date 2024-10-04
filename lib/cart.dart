import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/CasualWear.dart';
import 'package:mad_sprinklez_final/home.dart';
import 'package:mad_sprinklez_final/myOrders.dart';
import 'package:mad_sprinklez_final/profile.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/order.dart';  // Import the new order details page

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int _currentIndex = 2; // Default to the shopping cart tab

  final List<Widget> _pages = [
    HomePage(),
    //SearchPage(), // Ensure search page is correct
    ShoppingCartPage(), // Shopping Cart page
    Profile(),
    MyOrdersPage()
  ];

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen size and orientation
    var screenSize = MediaQuery.of(context).size;
    var isPortrait = screenSize.height > screenSize.width; // Check if in portrait mode

    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView( // making the page scrollable when in landscape mode
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center( // Center the content in the screen
            child: ConstrainedBox( // Restrict content width
              constraints: BoxConstraints(
                maxWidth: isPortrait ? double.infinity : 600, // Max width for landscape
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shopping Cart',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: ClipOval(
                          child: Image.asset(
                            'Assets/Images/Logo.png', // Adjust the path as needed
                            height: isPortrait ? 100 : 60, // Adjust height based on orientation
                            width: isPortrait ? 60 : 40,  // Adjust width based on orientation
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Items',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  CartItem(
                    imageUrl: 'Assets/Images/Long Sleeve Top.jpg', // Adjust the path as needed
                    title: 'Long Sleeve Top With Front Detail',
                    price: '3890.00',
                    quantity: 1,
                    size: 'UK 6',
                    color: 'Beige',
                    screenSize: screenSize, // Pass screen size for responsiveness
                  ),
                  SizedBox(height: 20),
                  CartItem(
                    imageUrl: 'Assets/Images/casualStripsShirt.jpeg', // Adjust the path as needed
                    title: 'Summer Long Sleeve Stripes Shirt',
                    price: '3500.00',
                    quantity: 1,
                    size: 'UK 6',
                    color: 'White',
                    screenSize: screenSize, // Pass screen size for responsiveness
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // Navigation bar
        currentIndex: _currentIndex, // Set the current selected index
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pink[100],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = 2; // Update current index
          });
          Navigator.pushReplacement( // Navigate based on selected index
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: [
          BottomNavigationBarItem( // adding icons to the bottom nav bar
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long), // Changed to orders icon
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

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final int quantity;
  final String size;
  final String color;
  final Size screenSize; // Add screen size for responsiveness

  CartItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.size,
    required this.color,
    required this.screenSize, // Add screenSize parameter
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the orientation and adjust the UI accordingly
    bool isPortrait = screenSize.height > screenSize.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl,
                    height: isPortrait ? 100 : 100,  // Keep the image height the same in landscape
                    width: isPortrait ? 80 : 80,   // Keep the width the same in landscape
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isPortrait ? 16 : 16,  // Keep font size the same in landscape
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Price : $price', style: TextStyle(fontSize: isPortrait ? 14 : 14)),
                      Text('Qty : $quantity', style: TextStyle(fontSize: isPortrait ? 14 : 14)),
                      Text('Size: $size', style: TextStyle(fontSize: isPortrait ? 14 : 14)),
                      Text('Color: $color', style: TextStyle(fontSize: isPortrait ? 14 : 14)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Add "Purchase Now" Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(
                      itemName: title,
                      itemPrice: price,
                      //isDarkMode: null, // Commented out dark mode reference
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[600], // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              child: Text(
                'Purchase Now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
