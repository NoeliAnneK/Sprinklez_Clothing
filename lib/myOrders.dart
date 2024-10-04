import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/home.dart';
import 'package:mad_sprinklez_final/myOrders.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/profile.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  int _currentIndex = 1; // Set the index to 1 as this page represents My Orders

  final List<Widget> _pages = [
    HomePage(),       // Home Page
    MyOrdersPage(),   // Current page (My Orders)
    ShoppingCartPage(), // Cart Page
    Profile(),         // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.pink[200], // Matching color theme
      ),
      backgroundColor: Colors.pink[100], // Background color matching the theme
      body: Center( // Wrap content in Center to restrict width in landscape mode
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isLandscape ? screenWidth * 0.7 : screenWidth, // Restrict width in landscape mode
          ),
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Orders Status:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 16),
              OrderItem(
                orderNumber: '12345',
                item: 'Casual Wear - T-Shirt',
                status: 'Delivered',
                imageUrl: 'Assets/Images/casual1.jpg',
              ),
              SizedBox(height: 16),
              OrderItem(
                orderNumber: '67890',
                item: 'Work Wear - Shirt',
                status: 'Pending',
                imageUrl: 'Assets/Images/work.jpg',
              ),
              SizedBox(height: 16),
              OrderItem(
                orderNumber: '54321',
                item: 'Party Wear - Dress',
                status: 'Processing',
                imageUrl: 'Assets/Images/party.jpeg',
              ),
            ],
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
            _currentIndex = index; // Update current index
          });
          Navigator.push( // Navigate based on selected index
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: [
          BottomNavigationBarItem( // Adding icons to the bottom nav bar
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

class OrderItem extends StatelessWidget {
  final String orderNumber;
  final String item;
  final String status;
  final String imageUrl;

  OrderItem({required this.orderNumber, required this.item, required this.status, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.pink[200], // Change card color to pink[200]
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #$orderNumber',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  Text(
                    item,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'Status: $status',
                    style: TextStyle(
                      fontSize: 16,
                      color: status == 'Delivered' ? Colors.green : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
